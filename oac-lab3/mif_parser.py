import re
import os.path

def get_instructions():
  file_path = os.path.join('oac-lab3', 'de1_text.mif')

  with open(file_path, 'r') as file:
    file_content = file.readlines()

  instruction_section_flag = False

  instructions = []
  INSTRUCTION_POSITION = 1
  for line in file_content:
    if 'END' in line:
      instruction_section_flag = False

    if instruction_section_flag:
      splited = re.split(':|;', line)
      instructions.append(splited[INSTRUCTION_POSITION].lstrip().rstrip())

    if 'BEGIN' in line:
      instruction_section_flag = True
  return instructions

def write_to_file(instructions):
  counter = 0
  file_path = os.path.join('oac-lab3', 'out.txt')
  file = open(file_path, 'w')
  
  for instr in instructions:
    file.write(f'BI[{counter}] = 32\'h{instr};\n')
    counter += 1
  file.close()
  
  return 

instructions = get_instructions()
write_to_file(instructions)
