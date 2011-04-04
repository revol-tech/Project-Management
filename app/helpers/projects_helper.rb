module ProjectsHelper

  def project_display(project)
    [
      "<div class = 'project_display'>",
      "<div class =  '#{deadline_class(project.deadline)}' value = '50'>Deadline: #{display_formatted_deadline(project.deadline)}</div>",
      "<p>Description:<br/>#{project.description}</p>",
      '</div>',
      ].join(' ').html_safe
    end

    def display_task_groups(project)
      arr = []
      arr << "<div class = 'task_group_list'>"
      project.task_groups.each do |taskgroup|
        arr << display_task_group(taskgroup)
      end
      arr << '</div>'
      return arr.join(' ').html_safe
    end

    def deadline_class(deadline)
      return 'green'
    end

    def display_formatted_deadline(deadline)
      time_rem = deadline.to_date - Time.now.to_date
      return "#{time_rem.truncate} Days Remaining"
    end
end
