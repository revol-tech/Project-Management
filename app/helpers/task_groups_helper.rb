module TaskGroupsHelper

   def display_task_group(task_group)
      content_tag :div do
         [
          "<div class = 'edit_links'>",link_to("edit",edit_project_task_group_path(task_group.project, task_group)),
          link_to("delete",project_task_group_path(task_group.project, task_group),:method => :delete,:confirm => "Are you Sure to delete this task group?" ),"</div>",
          "<h2>#{task_group.project.title} --> #{task_group.title}</h2>",
          '<h3>Objective: ', task_group.objective, '</h3>',
          ].join(' ').html_safe
        end
    end
end
