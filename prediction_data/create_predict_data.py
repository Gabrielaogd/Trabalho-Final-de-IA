import os
import pandas as pd
from Bio import PDB
import warnings

BACKEND_PATH = '/home/vinicius/benderdb/backend-flask/'
FRONTEND_PATH = '/home/vinicius/benderdb/frontend-react/'

# Ignore other warnings to keep the output clean
warnings.filterwarnings("ignore")


def get_deeppocket_residues(pdb):
	df = pd.read_csv(BACKEND_PATH + 'data/deeppocket/DeepPocket_Concatenated_Sites.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)


	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))
	return unique_elements


def get_grasp_residues(pdb):
	
	df = pd.read_csv(BACKEND_PATH + 'data/grasp/GRaSP_Concatenated_Sites.csv')
	result = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	binding_site = result[0] if len(result) > 0 else None

	if binding_site:
		return [(res.split('_')[2]) for res in binding_site.split(',')]

	return []


def get_p2rank_residues(pdb):

	df = pd.read_csv(BACKEND_PATH + 'data/p2rank/p2Rank_Concatenated_Sites.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)

	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_pointsite_residues(pdb):

	df = pd.read_csv(BACKEND_PATH + 'data/pointsite/PointSite_Concatenated_Sites.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)

	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_puresnet_residues(pdb):

	df = pd.read_csv(BACKEND_PATH + 'data/puresnet/PUResNet_Concatenated_Sites.csv')
	results = df.loc[df['Protein'] == pdb, 'Binding_Site'].values
	all_results = []

	for resul in results:
		res_seq_numbers = [(res.split('_')[2]) for res in resul.split(',')]
		all_results.append(res_seq_numbers)

	
	unique_elements = list(set(element for sublist in all_results for element in sublist))
	#sorted_unique_elements = sorted(unique_elements, key=lambda x: int(x))

	return unique_elements


def get_pdb_residues(dataset, pdb):

	parser = PDB.PDBParser()
	structure = parser.get_structure(pdb, dataset + '/AF-' + pdb + '-F1-model_v4.pdb')
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

	ds = 'Mycobacterium_ulcerans'
	print('Creating data for dataset:', ds)
	dataset = '/home/vinicius/content-bender/pdbs/' + ds
	pdbs = [pdb.split('-')[1] for pdb in os.listdir(dataset)]
	all_res_list = []
	cont = 0
	for pdb in pdbs:
			cont += 1
			if cont % 500 == 0:
					print("Getting data from protein number", cont)
			all_res_list.append(get_pdb_residues(dataset, pdb))

	final_result_file = open('data_to_predict_' + ds + '.csv', 'w')
	final_result_file.write('residue\tgrasp\tpuresnet\tdeeppocket\tpointsite\tp2rank\n')
	for res_dict in all_res_list:
			for k in res_dict:
					final_result_file.write('%s' % k)
					for r in res_dict[k]:
							final_result_file.write('\t%d' % r)
					final_result_file.write('\n')

	final_result_file.close()
