module ProjectsHelper

  def project_display(project)
    [
      '<div>',
      '<h2>', project.title, '</h2>',
      project.deadline,  '<br/>',
      project.description,
      '</div>',
      ].join(' ').html_safe
    end

    def display_task_groups(project)
      arr = []
      arr << "<ul>"
      project.task_groups.each do |taskgroup|
        arr << '<li>'
        arr << display_task_group(taskgroup)
        arr << '</li>'
      end
      arr << '</ul>'
      return arr.join(' ').html_safe
    end
end
