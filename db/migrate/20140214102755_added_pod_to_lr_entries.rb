class AddedPodToLrEntries < ActiveRecord::Migration
  def change
    add_attachment :lr_entries, :pod
  end
end
