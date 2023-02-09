class Employee < ApplicationRecord
    belongs_to :clien 
    mount_uploader :sow_att, FileUploader
    mount_uploader :quotation_att, FileUploader
    mount_uploader :po_att, FileUploader
    
    def self.search(pattern)
        if pattern.blank?  # blank? covers both nil and empty string
          all
        else
          joins('INNER JOIN cliens ON cliens.clien_id = employees.clien_id').select('*').where('nik LIKE ? OR name LIKE ?', "%#{pattern}%", "%#{pattern}%")
        end
    end
end
