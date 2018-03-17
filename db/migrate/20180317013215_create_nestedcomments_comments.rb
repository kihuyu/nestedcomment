class CreateNestedcommentsComments < ActiveRecord::Migration[5.1]
  def change
    create_table :nestedcomments_comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.string :username
      t.integer :article_id

      t.timestamps
    end
  end
end
