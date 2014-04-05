class Product < ActiveRecord::Base


	 belongs_to :user

	include PgSearch
	multisearchable :against => [:name, :description]

	pg_search_scope :search, against: [:name, :description],
	using: {tsearch: {dictionary: "english"}},
	associated_against: {user: :username}
	has_attached_file :image
	do_not_validate_attachment_file_type :image
	def self.text_search(query)
	  if query.present?
	  	search(query)
	  else
	    scoped
	  end
	end

	    def previous
	    	Product.where(["id < ?", id]).last
	    end
	    def next
	    	Product.where(["id > ?", id]).first
	    end

end
