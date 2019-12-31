
pass_range = [402328,864247];

count = 0;

for num = pass_range(1):pass_range(2)

    num_array = str2double(regexp(num2str(num),'\d','match'));

    d1 = num_array(1);
    d2 = num_array(2);
    d3 = num_array(3);
    d4 = num_array(4);
    d5 = num_array(5);
    d6 = num_array(6);

    is_duplicate = ((d1 == d2 && d2 ~= d3) ...
               || (d2 == d3 && d1 ~= d2 && d3 ~= d4)...
               || (d3 == d4 && d2 ~= d3 && d4 ~= d5)...
               || (d4 == d5 && d3 ~= d4 && d5 ~= d6)...
               || (d5 == d6 && d4 ~= d5));

    is_sorted = issorted(num_array);

    if is_duplicate && is_sorted
        count = count+1;
    end


end
