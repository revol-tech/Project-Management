module TasksHelper

    def display_task( task )
        [
          "<h3><a href= '#'>#{task.title}</a></h3>",
          "<div>",
          "<div class = 'edit_links'>",link_to("edit",edit_task_group_task_path(task.task_group, task)),
          link_to("delete",task_group_task_path(task.task_group, task),:method => :delete,:confirm => "Are you Sure to delete this task?" ),"</div>",
          "<span class =  '#{deadline_class(task.deadline)}' value = '50'>Deadline: #{display_formatted_deadline(task.deadline)}</span><br/>",
          "<div class ='objective' >Objective: #{task.objective}</div>",
          "Assigned to --> ",
          task.person.name,
          "<br/>Status: #{complete_message(task.complete)}<br/>",
          "Comment: #{task.comment}<br/>",
          link_to("Change Status",  task_toggle_complete_path(task)),
          "</div>",
        ].join(' ').html_safe
  end

  def complete_message ( status )
    if status == true
      return "Complete"
    else
      return "Incomplete"
    end
  end
end


  def view_assigned_tasks(person)
    arr = []
    tasks = Task.where(:person_id == person.id )
    tasks.each do |t|
    arr << t.title
    end
    arr.join(' ').html_safe
  end