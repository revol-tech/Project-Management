module TasksHelper

    def display_task( task )
        [
          "<h3><a href= '#'>#{task.title}</a></h3>",
          "<div>",
          "<div class ='objective' >Objective: #{task.objective}</div>",
          "<span class =  '#{deadline_class(task.deadline)}' value = '50'>Deadline: #{display_formatted_deadline(task.deadline)}</span>",
          task.person.email,"</div>"
        ].join(' ').html_safe
  end
end


