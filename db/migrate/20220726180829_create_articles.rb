class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string  :title
      t.text    :description

    end
    #create_table (:articles) {|t|
    #  t.string(:title)
    #  t.text(:description)

    #}

  end
end
