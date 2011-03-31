module TaskGroupsHelper

   def display_task_group(task_group)
      content_tag :div do
         [
          '<h3>', task_group.title,'</h3>',
          '<div>', task_group.objective, '</div>',
          '<div>', task_group.deadline,  '</div>',
          link_to("Show",task_group_path(task_group)),
          link_to("edit",edit_project_task_group_path(task_group.project, task_group)),
          link_to("delete",project_task_group_path(task_group.project, task_group),:method => :delete )
          ].join(' ').html_safe
        end
    end
end
