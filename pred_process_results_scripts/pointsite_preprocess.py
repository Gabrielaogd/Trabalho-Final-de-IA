import os
import pandas as pd

dict_amino = {'CYS': 'C', 'ASP': 'D', 'SER': 'S', 'GLN': 'Q', 'LYS': 'K',
     'ILE': 'I', 'PRO': 'P', 'THR': 'T', 'PHE': 'F', 'ASN': 'N', 
     'GLY': 'G', 'HIS': 'H', 'LEU': 'L', 'ARG': 'R', 'TRP': 'W', 
     'ALA': 'A', 'VAL':'V', 'GLU': 'E', 'TYR': 'Y', 'MET': 'M'}


def get_key_from_value(dictionary, value):
    for key, val in dictionary.items():
        if val == value:
            return key
    return None

ds = 'pointsite_test_results'

ds_num = 'test'

ds_folder = '/home/viniciusp/Desktop/coach-experiments/test_data/test_preds_results/' + ds + '/'

files = os.listdir(ds_folder)

files = [file+'/'+file+'_output.xyz' for file in files]

num_files = len(files)

num_files_ok = input('Numero de arquivos ok? ' + str(num_files))

cont = 1

print('Preprocessing DS' + ds_num)

df = pd.DataFrame(columns=['Protein', 'Binding_Site'])

for prediction_file in files:
     print(prediction_file)
     if cont % 1000 == 0:
          print('Reading file {}/{}'.format(cont, num_files))
     cont = cont + 1

     try:
         file_xyz = open(ds_folder + prediction_file, "r")
         data = file_xyz.readlines()
         file_xyz.close()
     except Exception as e:
          print(e)
          continue

     data = [line.replace('\n','').split() for line in data]

     filtered_data = []
     # filters only lines with label greater than 0.5
     for line in data:
          if float(line[5].split('e')[0]) >= 0.5 and float(line[5].split('e')[0]) <= 1.0:
               filtered_data.append(line)

     if filtered_data == []:
          continue

     # format string to: "A_PHE_52"
     filtered_data = [data[0][0] + '_' + get_key_from_value(dict_amino, data[1][0]) + '_' + data[0].split('|')[1] for data in filtered_data]
     filtered_data = list(set(filtered_data))
     # sort list of binding residues
     filtered_data = sorted(filtered_data, key=lambda x: (x.split('_')[2]))
     # convert list of strings to string
     filtered_data = ','.join(filtered_data)

     # create a new df and then concatenate do main df
     bs_row = pd.DataFrame({'Protein' : prediction_file.split('/')[0], 'Binding_Site': [filtered_data]}, index=[0])
     df = pd.concat([df, bs_row], ignore_index=True)

df.to_csv('PointSite_' + ds_num + '_results.csv', index=False)

