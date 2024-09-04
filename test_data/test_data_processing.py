import os
import pandas as pd
from Bio import PDB
import warnings

# Ignore other warnings to keep the output clean
warnings.filterwarnings("ignore")


def get_deeppocket_residues(pdb):
	df = pd.read_csv('test_data/test_preds_results/DeepPocket_test_results.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)


	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_grasp_residues(pdb):
	
	df = pd.read_csv('test_data/test_preds_results/GRaSP_test_results.csv')
	result = df.loc[df['Protein'] == pdb, 'Binding Site'].values
	binding_site = result[0] if len(result) > 0 else None

	if binding_site:
		return [(res.split('_')[2]) for res in binding_site.split(',')]

	return []


def get_p2rank_residues(pdb):

	df = pd.read_csv('test_data/test_preds_results/p2Rank_test_results.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)

	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_pointsite_residues(pdb):

	df = pd.read_csv('test_data/test_preds_results/PointSite_test_results.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)

	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_puresnet_residues(pdb):

	df = pd.read_csv('test_data/test_preds_results/PUResNet_test_results.csv')
	results = df.loc[df['Protein'] == pdb+'.pdb', 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)

	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_labels():
	file = open('test_data/test_binding_labels_formatted.txt')
	file_lines = file.readlines()
	file.close()

	labels_dict = {}
	for line in file_lines:
		key = line[:5]
		if key == '1whtA':
			continue
		value = [x for x in line.split()[1].split(',')]
		if key in labels_dict:
			labels_dict[key].extend([v for v in value if v not in labels_dict[key]])
		else:
			labels_dict[key] = value
	
	sorted_dict = {k: sorted(v) for k, v in labels_dict.items()}
	return sorted_dict


def get_pdb_residues(dataset, pdb):

	parser = PDB.PDBParser()
	structure = parser.get_structure(pdb, dataset + '/' + pdb + '.pdb')
	unique_residues_dict = {}

	for model in structure:
		for chain in model:
			for residue in chain:
				res_num = ''.join(str(element) for element in residue.get_id()).replace(' ','')
				residue_id = f"{pdb}_{residue.get_resname()}_{res_num}_{chain.id}"
				unique_residues_dict[residue_id] = []

	deeppocket_residues = get_deeppocket_residues(pdb)
	grasp_residues = get_grasp_residues(pdb)
	p2rank_residues = get_p2rank_residues(pdb)
	pointsite_residues = get_pointsite_residues(pdb)
	puresnet_residues = get_puresnet_residues(pdb)
 
 
	
	
	for key in unique_residues_dict:
		if (key.split('_')[2]) in grasp_residues:
			unique_residues_dict[key].append(1)
		else:
			unique_residues_dict[key].append(0)

		if (key.split('_')[2]) in puresnet_residues:
			unique_residues_dict[key].append(1)
		else:
			unique_residues_dict[key].append(0)

		if (key.split('_')[2]) in deeppocket_residues:
			unique_residues_dict[key].append(1)
		else:
			unique_residues_dict[key].append(0)

		if (key.split('_')[2]) in pointsite_residues:
			unique_residues_dict[key].append(1)
		else:
			unique_residues_dict[key].append(0)

		if (key.split('_')[2]) in p2rank_residues:
			unique_residues_dict[key].append(1)
		else:
			unique_residues_dict[key].append(0)

	return unique_residues_dict


if __name__ == '__main__':
    
	'''
	Predictors labels order:
	[grasp, puresnet, deeppocket, pointsite, p2rank]
	'''

	dataset = 'test_data/test_coach_pdbs'
	pdbs = [pdb[:5] for pdb in os.listdir(dataset)]

	all_res_list = []
	for pdb in pdbs:
		all_res_list.append(get_pdb_residues(dataset, pdb))
 
	labels = get_labels()

	final_result_file = open('test_final_data.csv', 'w')
	final_result_file.write('residue\tgrasp\tpuresnet\tdeeppocket\tpointsite\tp2rank\tlabel\n')
	for res_dict in all_res_list:
		for k in res_dict:
			prot_name = k[:5]
			res_num = (k.split('_')[2])
			if res_num in labels[prot_name]:
				res_dict[k].append(1)
			else:
				res_dict[k].append(0)

			final_result_file.write('%s' % k)
			for r in res_dict[k]:
				final_result_file.write('\t%d' % r)
			final_result_file.write('\n')

	final_result_file.close()
