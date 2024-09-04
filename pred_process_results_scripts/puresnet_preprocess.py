import pandas as pd
import os, math, time
from Bio import PDB

def PredictionTotalElapsedTime(total):
	if total < 60:
		print('Total elapsed time: {} seconds'.format(round(total, 2)))
	elif total < 3600:
		print('Total elapsed time: {} minutes e {} seconds'.format(total//60, round(total % 60, 2)))
	else:
		print('Total elapsed time: {} hours, {} minutes e {} seconds'.format(total//3600, (total%3600)//60, round(((total%3600)%60)%60, 2)))

def Calculate_Distance(str_residues, pkt_residues):
	pocket_residues = []
	# Loop to run in residues in pdb file
	for str_res in str_residues:
		# Loop to run in atoms of each residue
		for str_atom in str_res.get_list():
			# Loop to run in residues in pdb file
			for pkt_res in pkt_residues:
				# Loop to run in atoms of each residue, in this case, just one
				for pkt_atom in pkt_res.get_list():
					# Calculate distance between atoms
					distance = str_atom - pkt_atom
					if distance <= 5.0:
						parent_residue = str_atom.get_parent()
						res_name = parent_residue.get_resname()
						res_seq = parent_residue.get_id()[1]
						found_res = 'A_' + res_name + '_' + str(res_seq)
						if found_res not in pocket_residues:
							pocket_residues.append(found_res)
	return pocket_residues


def Map_Residues(structure, pocket, chain):

	str_chain = structure[0][chain]
	str_residues = str_chain.get_list()

	try:
		pkt_chain = pocket[0][' ']
		pkt_residues = pkt_chain.get_list()
	except:
		return []

	pocket_residues = Calculate_Distance(str_residues, pkt_residues)

	return pocket_residues

def Create_DataFrame(ds_results, ds_num, ds_data):

	ds_folder = '/home/vinicius/Desktop/PUResNet/' + ds_results + '/'
	ds_folder_data = '/home/vinicius/Desktop/coach-experiments/test_data/' + ds_data + '/'

	predict_folders = os.listdir(ds_folder)
	df = pd.DataFrame(columns=['Protein', 'Pocket', 'Binding_Site'])

	cont = 1
	print('Preprocessing dataset', ds_num)
	for folder in predict_folders:
		if cont % 100 == 0:
			print('Reading file {}/{}'.format(cont, len(predict_folders)))
		cont = cont + 1

		pocket_files = os.listdir(ds_folder + folder)
		if not pocket_files:
			continue
		
		pdb_parser = PDB.PDBParser(QUIET=True)
		structure = pdb_parser.get_structure('Structure', ds_folder_data + folder)
		pkt_num = 0
		
		for p in pocket_files:
			
			# Load the PDB file
			pocket = pdb_parser.get_structure('Pocket', ds_folder + folder + '/' + p)
			pocket_residues = Map_Residues(structure, pocket, folder[4])
			
			if not pocket_residues:
				continue

			pkt_num += 1
			# create a new df and then concatenate do main df
			bs_row = pd.DataFrame({'Protein' : folder, 'Pocket' : pkt_num , 'Binding_Site': ','.join(pocket_residues[3:])}, index=[0])
			df = pd.concat([df, bs_row], ignore_index=True)

	print(df.head())
	df.to_csv('PUResNet_DS_' + ds_num + '.csv', index=False)

if __name__=='__main__':

	begin = time.time()
	ds_data = 'test_coach_pdbs'
	ds_results = 'puresnet_test_results'
	ds_num = 'coach'

	Create_DataFrame(ds_results, ds_num, ds_data)

	end = time.time()
	PredictionTotalElapsedTime(end-begin)