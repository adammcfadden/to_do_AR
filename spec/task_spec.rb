require 'spec_helper'
require 'pry'

describe(Task) do
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end

  describe(".task_where") do
    it("returns all tasks that have a specified list_id") do
      task1 = Task.new({:description => 'puppies', :list_id => 2})
      task2 = Task.new({:description => 'kittens', :list_id => 2})
      task1.save()
      task2.save()
      expect(Task.task_where(2)).to(eq([task1, task2]))
    end
  end
end




#-------OLD SPECS-------------------#
#
#   describe(".clear") do
#     it("empties out all of the saved tasks") do
#       Task.new("wash the lion").save()
#       Task.clear()
#       expect(Task.all()).to(eq([]))
#     end
#   end
# end
