import pandas as pd
import os

ds = 'deeppocket_test_results'
ds_num = 'test'
ds_folder = '/home/viniciusp/Desktop/coach-experiments/test_data/test_preds_results/' + ds + '/'

folder_predicts = os.listdir(ds_folder)
folder_predicts = [f + '/' + f + '_nowat_out/pockets' for f in folder_predicts]


num_files = len(folder_predicts)
#num_files_ok = input('Numero de arquivos ok? ' + str(num_files))
cont = 1

df = pd.DataFrame(columns=['Protein', 'Pocket', 'Confidence', 'Binding_Site'])

print('Preprocessing DS ' + ds_num)

for folder in folder_predicts:

	if cont % 50 == 0:
		print('Reading file {}/{}'.format(cont, num_files))
	cont = cont + 1

	protein_name = folder.split('/')[0]
	
	# Get accepted confidence values of binding pockets
	try:
		confidence_file = open(ds_folder + folder + '/bary_centers_confidence.txt','r')
		sites_confidence = confidence_file.readlines()
		confidence_file.close()
	except:
		continue

	sites_confidence = sites_confidence[0].replace('[','').replace(']','').replace(',','')
	sites_confidence = sites_confidence.split()
	accepted_conf_sites = sites_confidence[:5]
	for conf in sites_confidence[5:]:
		if float(conf) >= 0.7 and float(conf) <= 1.0:
			accepted_conf_sites.append(conf)
		else:
			break	

# Get pocket rankings 
	ranked_file = open(ds_folder + folder + '/bary_centers_ranked.types','r')
	sites_rank = ranked_file.readlines()
	ranked_file.close()
	sites_rank = [site.split()[0] for site in sites_rank]
	accepted_rank_sites = sites_rank[:len(accepted_conf_sites)]

	# Open each pdb file according to ranked sites
	for site_num in accepted_rank_sites:
		pdb_pocket_file = open(ds_folder + folder + '/pocket' + site_num + '_atm.pdb','r')
		pdb_lines = pdb_pocket_file.readlines()
		pocket = []
		
		for line in pdb_lines:
			if line[:4] == 'ATOM':
				chain = line[21:22]
				res_name = line[17:20]
				seq_num = line[22:26].replace(' ','')
				res_info = chain + '_' + res_name + '_' + seq_num
				if res_info not in pocket:
					pocket.append(res_info)
		
				# For each binding pocket, store its info in list
		pocket = sorted(pocket, key=lambda x: int(x.split('_')[2]))
		pocket.insert(0, accepted_conf_sites[accepted_rank_sites.index(site_num)])
		pocket.insert(0, site_num)
		pocket.insert(0, protein_name)

		# Convert list of binding pocket to dataframe and store it to final dataframe
		bs_row = pd.DataFrame({'Protein' : pocket[0], 'Pocket': pocket[1], 'Confidence' : pocket[2], 'Binding_Site': ','.join(pocket[3:])}, index=[0])
		df = pd.concat([df, bs_row], ignore_index=True)

df.to_csv('DeepPocket_' + ds_num + '_results.csv', index=False)




