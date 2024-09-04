import pandas as pd
import os


# Function to split the values
def split_value(value):
    values = value.split()
    return [[v.split('_')[0], int(v.split('_')[1])] for v in values]

# Function to get residue_name
def get_residue_name(chain, number):
    match = df[(df[' chain'] == chain) & (df[' residue_label'] == number)]
    if not match.empty:
        return match[' residue_name'].iloc[0]
    return None

binding_site_list = []

ds = 'p2rank_test_results'

ds_num = 'coach'

ds_folder = '/home/vinicius/Desktop/coach-experiments/test_data/test_preds_results/' + ds + '/'

files = os.listdir(ds_folder)

files = [file for file in files if 'predictions.csv' in file]

num_files = len(files)

num_files_ok = input('Numero de arquivos ok? ' + str(num_files))

cont = 1

file_errors = open('Run_Again_p2Rank_DS' + ds_num + '.txt', 'w')

print('Preprocessing DS' + ds_num)

main_df = pd.DataFrame(columns=['Protein', 'Binding_site'])

for prediction_file in files:
	print(prediction_file)
	if cont % 50 == 0:
		print('Reading file {}/{}'.format(cont, num_files))
	cont = cont + 1

	try:
		df = pd.read_csv(ds_folder + prediction_file)
	except:
		file_errors.write('%s\n' % prediction_file)
		continue

	#print(df)

	filtered_df = df[df[' probability'] > 0.5]
	if len(filtered_df.index) < 5:
		filtered_df = df.head()
	if filtered_df.empty:
		continue
	
	try:
		results = df[' residue_ids'].apply(split_value).tolist()
	except:
		print(prediction_file)
		continue

	

	df_res = pd.read_csv(ds_folder + prediction_file.split('_')[0] + '_residues.csv')
	
	#print(df_res)
	for site in results:
		for resi in site:
			match = df_res[(df_res['chain'].astype(str) == resi[0]) & (df_res[' residue_label'].astype(str) == str(resi[1]))]
			#print(match)
			try:
				resi.insert(1, match[' residue_name'].values[0])
			except:
				continue
	#print(results)
	
	formatted_data = [[f'{x[0]}_{x[1]}_{x[2]}' for x in sublist] for sublist in results]

	protein_name = prediction_file.split('.')[0]

	df_out = pd.DataFrame({'Protein': protein_name, 'Binding_site': formatted_data})

	df_out['Binding_site'] = df_out['Binding_site'].apply(lambda x: ','.join(x))

	main_df = pd.concat([main_df, df_out], ignore_index=True)

main_df.to_csv('p2Rank_test_' + ds_num + '.csv', index=False)