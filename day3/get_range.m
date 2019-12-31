function [horiz_range,vert_range] = get_range(d)

dis_vec = cellfun(@(x) str2double(x(2:end)),d);
is_neg = cellfun(@(x) ~isempty(regexp(x,'^L|D','once')),d);

dis_vec(is_neg) = dis_vec(is_neg)*-1;

start_horiz = ~isempty(regexp(d{1},'^L|R','once'));

if start_horiz
    horiz_travel = cumsum(dis_vec(1:2:end));
    vert_travel = cumsum(dis_vec(2:2:end));
else
    horiz_travel = cumsum(dis_vec(2:2:end));
    vert_travel = cumsum(dis_vec(1:2:end));
end

horiz_range = [min([0,horiz_travel]),max([0,horiz_travel])];
vert_range = [min([0,vert_travel]),max([0,vert_travel])];

end
