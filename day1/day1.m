module_mass = load('input');

fuel_mass = @(m) floor(m./3)-2;

total_fuel = sum(fuel_mass(module_mass));

is_done = false;

fuel_for_fuel = 0;

module_fuel_mass = cat(1,module_mass);

fuel_mass_array = fuel_mass(module_fuel_mass);

count = 1;

while ~is_done
    count = count+1;
    fuel_mass_array(:,count) = fuel_mass(fuel_mass_array(:,count-1));
    is_below = fuel_mass_array(:,count)<0;
    fuel_mass_array(is_below,count) = 0;
    is_done = all(fuel_mass_array(:,count)==0);
end

final_total_fuel = sum(fuel_mass_array(:));