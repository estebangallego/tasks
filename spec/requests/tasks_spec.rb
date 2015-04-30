require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  # before do
  #   Task.create(task_params)
  #   # @task = Task.create :task => 'go to bed'
    
  # end
  config.include Capybara::DSL
  describe 'GET /tasks' do
  	it 'display some task' do
  		@task = Task.create :task => 'go to bed'
  		visit root_path
  		page.should have_content 'go to bed'

    end

    it 'creates a new task' do
    	visit '/'
    	fill_in 'Task', :with => 'go to work'
    	click_button 'Create Task'

    	current_path.should == task_path
    	page.should have_content 'go to work'
    	
    	save_and_open_page
    end
  end

  describe 'PUT /tasks' do 
    it 'edits a task' do 
      visit task_path
      click_link 'Edit'

      current_path.should == edit_task_path(@task)

      page.should have_content 'go to bed'
      fill_in 'Task', :with => 'updated task'
      click_button 'Update Task'

      current_path.should == task_path

      page.should have_content 'updated task'
    end
  end
end
