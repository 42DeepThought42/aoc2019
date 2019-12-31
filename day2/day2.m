

fin_val = 0;

noun = 0;
verb = 0;
while fin_val~=19690720

    noun = noun+1;

    if noun > 100
        verb = verb + 1;
        noun = 0;
    end

    fid = fopen('input_intcode','r');
    instruction_array = textscan(fid,'%d','delimiter',',');
    fclose(fid);

    instruction_array = cat(2,instruction_array{:});

    instr_pointer = 1;
    is_done = false;

    instruction_array(2) = noun;
    instruction_array(3) = verb;

    while ~is_done

        [instruction_array,is_done] = opcode_entry(instruction_array,instr_pointer);
        instr_pointer = instr_pointer + 4;

    end

    fin_val = instruction_array(1);
end
