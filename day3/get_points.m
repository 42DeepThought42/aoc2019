function [points_array_total,points_array] = get_points(d)

dis_vec = cellfun(@(x) str2double(x(2:end)),d);
is_neg = cellfun(@(x) ~isempty(regexp(x,'^L|U','once')),d);

dis_vec(is_neg) = dis_vec(is_neg)*-1;

start_horiz = ~isempty(regexp(d{1},'^L|R','once'));

points_array = zeros([numel(d),2]);

if start_horiz
    horiz_travel = (dis_vec(1:2:end));
    vert_travel = (dis_vec(2:2:end));

    points_array(1:2:end,2) = horiz_travel;
    points_array(2:2:end,1) = vert_travel;

else
    horiz_travel = (dis_vec(2:2:end));
    vert_travel = (dis_vec(1:2:end));

    points_array(1:2:end,1) = vert_travel;
    points_array(2:2:end,2) = horiz_travel;
end

points_array_total = cat(1,[0,0],cumsum(points_array,1));

end
