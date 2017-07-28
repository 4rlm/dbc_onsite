helpers do

  module FileMagic

    module Export
      def to_csv
        CSV.open(@file_path, "wb") do |csv|
          csv << @model_name.attribute_names
          @model_name.all.each { |r| csv << r.attributes.values }
        end
      end

      def and_download
        to_csv
        self
      end
    end

    module Import
      def from_csv

      end

        #######################################
        # ===== Import CSV =====
        def import_csv(file_name, model)

          extracted_file = []
          CSV.foreach(file_path, headers: true, skip_blanks: true) do |row|

            extracted_file << row.to_h

            # if obj = model.find_by(id: valid_hash["id"])
            #     model.record_timestamps = false
            #     obj.update_attributes(valid_hash)
            #     model.record_timestamps = true
            # else
            #     valid_hash[sts_col] = "Imported" if sts_col
            #     model.create!(valid_hash)
            # end
          end
          binding.pry
          extracted_file

        end

    #######################################
    end

  end


  #####################

  class MagicFiler
    include FileMagic::Export
    include FileMagic::Import
    attr_reader :file_name, :file_path

    def initialize(model_name)
      @model_name = model_name
      @dir = "xfiles"
      @file_name = make_csv_name
      @file_path = make_file_path
    end

    def make_csv_name
      current_time = DateTime.now.to_i
      model_name_to_str = "#{@model_name.to_s.pluralize.downcase}"
      file_name = "#{model_name_to_str}_#{current_time}.csv"
    end

    def make_file_path
      file_path = "#{@dir}/#{@file_name}"
    end

  end

end
