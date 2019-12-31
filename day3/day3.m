

fid = fopen('day3_input','r');
l1_str = fgetl(fid);
l2_str = fgetl(fid);
fclose(fid);

l1 = strsplit(l1_str,',');
l2 = strsplit(l2_str,',');

% l1 = {'U2','R3','D2'};
% l2 = {'D1','R1','U4','R3','D2','L2'};

% l1 = {'R75','D30','R83','U83','L12','D49','R71','U7','L72','U62','R66','U55','R34','D71','R55','D58','R83'};
% l2 = {'R98','U47','R26','D63','R33','U87','L62','D20','R33','U53','R51','U98','R91','D20','R16','D67','R40','U7','R15','U6','R7'};


[l1_h,l1_v] = get_range(l1);
[l2_h,l2_v] = get_range(l2);

grid_h = [min(cat(2,l1_h,l2_h)), max(cat(2,l1_h,l2_h))];
grid_v = [min(cat(2,l1_v,l2_v)), max(cat(2,l1_v,l2_v))];

origin_ind = [grid_v(2)+1,1-grid_h(1)];

init_grid = zeros([diff(grid_v)+1,diff(grid_h)+1]);

l1_points = get_points(l1);
l2_points = get_points(l2);

l1_array = draw_path(l1_points,init_grid,origin_ind);
l2_array = draw_path(l2_points,init_grid,origin_ind);

is_cross = l1_array>01&l2_array>0;

[x,y] = ind2sub(size(init_grid),find(is_cross));

l1_steps_to_cross = l1_array(is_cross);
l2_steps_to_cross = l2_array(is_cross);

sum_steps_to_cross = l1_steps_to_cross+l2_steps_to_cross;

manhatten_distance = sum(abs(cat(2,x,y)-repmat(origin_ind,[numel(x),1])),2);
