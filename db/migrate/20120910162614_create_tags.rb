# encoding: utf-8

class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string  :alias
      t.string  :name
      t.text    :settings
      t.timestamps
    end
    add_index :tags, :alias, unique: true

    create_table :r_threads_tags do |t|
      t.integer :r_thread_id
      t.integer :tag_id
    end

    b = Tag.create(alias: 'b', name: 'Бред')
    Tag.create(alias: 'd', name: 'О сайте')
    Tag.create(alias: 's', name: 'Программы')
    Tag.create(alias: 'trash', name: 'Мусор')

    RThread.all.each do |t| t.tags << b end
  end
end
