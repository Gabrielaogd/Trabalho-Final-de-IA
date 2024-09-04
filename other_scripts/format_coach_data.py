def format_binding_labels():
	b_file = open('test_data/test_binding_labels.txt')
	b_file_lines = b_file.readlines()
	b_file.close()


	new_b_file_lines = []
	for b_line in b_file_lines:
		pdb_name = b_line[:5]


		p_file = open('test_data/test_coach_pdbs/' + pdb_name + '.pdb')
		p_file_lines = p_file.readlines()
		p_file.close()
		begin_p_file = int(p_file_lines[0][22:26].strip())
		end_p_file = int(p_file_lines[-1][22:26].strip())


		c_file = open('receptor2/' + pdb_name + '.pdb')
		c_file_lines = c_file.readlines()
		c_file.close()
		begin_c_file = int(c_file_lines[0][22:26].strip())
		end_c_file = int(c_file_lines[-2][22:26].strip())
		
		if not (begin_p_file == begin_c_file and end_p_file == end_c_file):
			residues = [int(res) for res in b_line.split()[1].split(',')]
			diff = begin_p_file - begin_c_file
			residues = [res + diff for res in residues]
			new_line = b_line.split()[0] + '\t' + ','.join(map(str, residues))
			new_b_file_lines.append(new_line)
		else:
			new_b_file_lines.append(b_line.replace('\n',''))

	file_out = open("test_binding_labels_formatted.txt", "w")
	for line in new_b_file_lines:
		file_out.write("%s\n" % line)
	file_out.close()


def format_pdb_files():

	training_data_file = open('teste.txt', 'r')
	training_data_lines = training_data_file.readlines()
	training_data_file.close()

	list_pdbs_chain = set([line.split('_')[0][:5] for line in training_data_lines])

	for train_item in list_pdbs_chain:
		file = open(train_item[:4] + '.pdb')
		pdb_lines = file.readlines()
		file.close()
		chain_lines = []
		for line in pdb_lines:
			if line[:4] == 'ATOM' and line[21:22] == train_item[4]:
				chain_lines.append(line)
		file_out = open('saida/' + train_item + '.pdb','w')
		for line in chain_lines:
			file_out.write('%s' % line)
		file_out.close()


if __name__ == '__main__':
	#format_binding_labels()
 	format_pdb_files()