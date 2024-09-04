import pandas as pd
import os


binding_site_list = []

ds = 'grasp_test_results'

ds_num = 'coach'

ds_folder = '/home/vinicius/Desktop/coach-experiments/test_data/test_preds_results/' + ds + '/'

files = os.listdir(ds_folder)

num_files = len(files)

cont = 1

file_errors = open('Run_Again_GRaSP_DS' + ds_num + '.txt', 'w')

print('Preprocessing DS_' + ds_num)

for prediction_file in files:

	if cont % 1000 == 0:
		print('Reading file {}/{}'.format(cont, num_files))
	cont = cont + 1

	try:
		df = pd.read_csv(ds_folder + prediction_file)
	except:
		file_errors.write('%s\n' % prediction_file)
		continue
	
	filtered_df = df[df['prediction'] == 1]

	if filtered_df.empty:
		continue
		
	column_values = filtered_df['res_name'].tolist()

	protein_name = column_values[0].split('_')[0]

	column_values = ['_'.join(value.split('_')[1:]) for value in column_values]

	column_values.insert(0, protein_name)

	binding_site_list.append(column_values)

#print(binding_site_list)

# Extract the first element from each inner list
first_column = [lst[0] for lst in binding_site_list]


# Extract the rest of the elements from each inner list
second_column = [','.join(map(str, lst[1:])) for lst in binding_site_list]


df = pd.DataFrame({'Protein': first_column, 'Binding Site': second_column})

df.to_csv('GRaSP_Test_DS_' + ds_num + '.csv', index=False)
