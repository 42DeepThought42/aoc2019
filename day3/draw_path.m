function [path_array] = draw_path(points,init_grid,origin_ind)
%DRAW_PATH Summary of this function goes here
%   Detailed explanation goes here

path_array = init_grid;

points_rel_o = points+repmat(origin_ind,[size(points,1),1]);

steps = 0;

for point_ind = 2:size(points_rel_o,1)
   
    last_point = points_rel_o(point_ind-1,:);
    next_point = points_rel_o(point_ind,:);
    
    this_point_steps = abs(diff(next_point-last_point));
    
    y_span = get_span(last_point(1),next_point(1));
    x_span = get_span(last_point(2),next_point(2));
    
    path_array(y_span,x_span) = steps:(steps+this_point_steps);
    
    steps = steps+this_point_steps;
    
end


end

function span = get_span(last,next)

    if (last-next)<0
        span = last:next;
    else
        span = last:-1:next;
    end
    
end

