class Foto < ActiveRecord::Base
  belongs_to :entidade

  has_attached_file :imagem,
                    :url  => "/fotos/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/fotos/:id/:basename_:style.:extension",
                    :styles => { :medium => "400x400>", :thumb => "150x150>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/

  validates :titulo, :presence => true

  acts_as_taggable_on :tags
end
