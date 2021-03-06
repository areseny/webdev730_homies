class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    drop_table :articles, if_exists: true

    create_table :articles do |t|
      t.text :article_url
      t.text :article_json

      t.timestamps
    end
  end
end
