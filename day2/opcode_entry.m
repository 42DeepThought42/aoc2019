function [instruction_array,is_done] = opcode_entry(instruction_array,pos_index)
    
    opcode = instruction_array(pos_index);
    
    if opcode ~= 99

        arg1_ind = instruction_array(pos_index+1)+1;
        arg2_ind = instruction_array(pos_index+2)+1;
        arg3_ind = instruction_array(pos_index+3)+1;

        arg1 = instruction_array(arg1_ind);
        arg2 = instruction_array(arg2_ind);

        is_done = false;

        switch opcode
            case 1
                instruction_array(arg3_ind) = arg1 + arg2;
            case 2
                instruction_array(arg3_ind) = arg1 * arg2;
        end
    else
        is_done = true;
    end
end
