helpers do

  module FileMagic

    module Export
      def backup_csv
        CSV.open(@file_path, "wb") do |csv|
          csv << @model.attribute_names
          @model.all.each { |r| csv << r.attributes.values }
        end
      end

      def download_csv
        backup_csv
        self
      end

    end

    module Import

      def upload_csv(filename, model)
        cols =  model.column_names

        CSV.foreach(filename, headers: true, skip_blanks: true) do |row|
          valid_hash = validate_hash(cols, row.to_hash)

          if obj = model.find_by(id: valid_hash["id"])
             model.record_timestamps = false
             obj.update_attributes(valid_hash)
           else
             model.record_timestamps = true
             model.create!(valid_hash)
           end

        end

      end

      def validate_hash(cols, hash)
        keys = hash.keys
        keys.each do |key|
          if !cols.include?(key)
              hash.delete(key)
          end
        end
        hash
      end

    #######################################
    end

  end


  #####################

  class MagicFiler
    include FileMagic::Export
    include FileMagic::Import
    attr_reader :file_name, :file_path

    def initialize(model)
      @model = model
      @file_name = "#{@model.to_s.pluralize.downcase}.csv"
      @dir_path = "./db/backups/"
      FileUtils.mkdir_p(@dir_path)
      @file_path = "#{@dir_path}/#{@file_name}"
    end

  end

end
