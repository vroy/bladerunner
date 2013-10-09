module Bladerunner
  class ApplicationController < ActionController::Base
    layout :set_layout

    def index
      @filenames = Rails.root.join("bladerunner").children.map(&:basename).map(&:to_s)
    end

    def run
      @filename = params[:filename]
      @timestamp = Rails.root.join("bladerunner", @filename).mtime.to_i

      execute_sql

      render layout: !request.xhr?
    end

    def test
      render json: { timestamp: Rails.root.join("bladerunner", params[:filename]).mtime.to_i }
    end

    private

    def execute_sql
      @sql = read_from_file(@filename)

      benchmark = Benchmark.measure do
        begin
          @res = ActiveRecord::Base.connection.execute(@sql)
        rescue => e
          @error_message = e.message
        end
      end

      if @res
        @rows = @res.to_a
        @timing_in_milliseconds = benchmark.real * 1000
        @fields = @res.fields
      end
    end

    def read_from_file(filename)
      Rails.root.join("bladerunner", "#{filename}").read
    end

    def set_layout
      request.xhr? ? false : 'bladerunner/application'
    end
  end
end
