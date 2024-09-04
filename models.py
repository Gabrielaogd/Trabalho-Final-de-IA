from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, confusion_matrix, matthews_corrcoef
from sklearn.tree import DecisionTreeClassifier
import pandas as pd
import joblib
import os
from tpot.config import classifier_config_dict
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
from xgboost import XGBClassifier
from sklearn.svm import SVC
from tpot import TPOTClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RandomizedSearchCV
import numpy as np
from scipy.stats import randint, uniform

'''
TPOT documentation: https://epistasislab.github.io/tpot/
'''
# SVM, RF e XGB

def get_train_data():
    df_train = pd.read_csv('train_data/train_final_data.csv', sep='\t')
    
    X_train = df_train.iloc[:, 1:6] #dados de treinamento features/caracteristicas
    y_train = df_train.iloc[:, -1] # dados do label

    return X_train, y_train

def get_test_data():
    df_test = pd.read_csv('test_data/test_final_data.csv', sep='\t')

    X_test = df_test.iloc[:, 1:6]
    y_test = df_test.iloc[:, -1]

    return X_test, y_test


def define_model_TPOT():
    
    custom_config = {
        'sklearn.ensemble.RandomForestClassifier': {
            'n_estimators': [50, 100, 200],
            'max_depth': [None, 10, 20],
            'min_samples_split': [2, 5, 10]
        },
        'sklearn.svm.SVC': {
            'C': [0.1, 1, 10],
            'kernel': ['linear', 'rbf']
        },
        'xgboost.XGBClassifier': {
            'n_estimators': [50, 100, 200],
            'max_depth': [3, 6, 10],
            'learning_rate': [0.01, 0.1, 0.2]
        }
    }


    X_train, y_train = get_train_data()
    X_test, y_test = get_test_data()

    for model_name, model_params in custom_config.items():
        print(f"Testing model: {model_name}")
        pipeline_optimizer = TPOTClassifier(
            generations=5,
            population_size=20,
            cv=5,
            random_state=42,
            config_dict={model_name: model_params},
            verbosity=2
        )

        pipeline_optimizer.fit(X_train, y_train)
        print(f"Model: {model_name}, Score: {pipeline_optimizer.score(X_test, y_test)}")
        pipeline_optimizer.export(f'tpot_exported_pipeline_{model_name}.py')


def create_model():

    X_train, y_train = get_train_data()
    
    print("Generating model")
    # Modelos otimizados
    models = {
        'XGBoost':XGBClassifier(learning_rate=0.01, max_depth=3, n_estimators=200),
        'SVM':SVC(C=0.1, kernel="linear"),
        'RandomForest':RandomForestClassifier(max_depth=None, min_samples_split=10, n_estimators=50)
    }
    # Treinar e avaliar cada modelo
    for name, model in models.items():
        print(f"Training {name}...")
        model.fit(X_train, y_train) # aqui treina o modelo

        print("Saving model")
        joblib.dump(model, f"{name}.pkl") # cria um arquivo p/ não usar essa função novamente


def test_model(model_file_name):
    X_test, y_test = get_test_data()
    print("Loading model")
    model = joblib.load(model_file_name)#pega o arquivo salvo do modelo ou pega create model

    print("Predicting data")
    y_test_pred = model.predict(X_test)# .fit treina .predict só pega as features- ele classifica e dá os labels, ele não pega as labels pre definidas, mas cria as proprias 

    accuracy = accuracy_score(y_test, y_test_pred)#valida o modelo pela acuracia
    mcc = matthews_corrcoef(y_test, y_test_pred)#valida o modelo por mcc
    precision = precision_score(y_test, y_test_pred)
    recall = recall_score(y_test, y_test_pred)
    f1 = f1_score(y_test, y_test_pred)
    conf_matrix = confusion_matrix(y_test, y_test_pred)


    print("Test set accuracy:", accuracy)
    print("Test set MCC:", mcc)
    print(f"Precision: {precision}")
    print(f"Recall: {recall}")
    print(f"F1-Score: {f1}")
    print("Confusion Matrix:")
    print(conf_matrix)

def make_predictions(X_pred, df_pred, dataset, model_file_name):
    print("Loading model")
    model = joblib.load(model_file_name)

    print("Starting predictions in dataset:", dataset)
    y_pred_real = model.predict(X_pred)#predicao nos dados reais, aplicacao real do modelo, vai gerar a label

    if len(df_pred['residue']) != len(y_pred_real):
        raise ValueError("Length of 'residue' column and NumPy array must be the same")
    else:
        print("Predictions done!")

    report_results(y_pred_real, df_pred, dataset, model_file_name[:-4])#cria um csv com os resultados filtrando apenas os que apresentam valor 1==sitio de ligação
    

def report_results(y_pred_real, df_pred, dataset, model):

    print("Reporting results")
    df_result = pd.DataFrame({
        'residue': df_pred['residue'],
        'prediction': y_pred_real
    })

    df_final = df_result.loc[df_result['prediction'] == 1]
    df_final.to_csv('final_ai_prediction_' + dataset + model + '.csv', index=False)


if __name__ == '__main__':

    
    # Roda o TPOT
    # define_model_TPOT()

    
    # Cria do modelo
    # create_model()
    
    # Linhas de teste dos modelos
    print("XGB ------------------------")
    test_model("XGBoost.pkl")
    print("SVM ------------------------")
    test_model("SVM.pkl")
    print("RF ------------------------")
    test_model("RandomForest.pkl")
    # make_predictions(model_file_name)
    # report_results(model_file_name)

    # print("Making predictions for dataset:", "predictTrypanossoma")
    # df_pred = pd.read_csv('prediction_data/data_to_predict' + "/predictTrypanossoma" + '.csv', sep='\t')
    # X_pred = df_pred.iloc[:, 1:6]

    # make_predictions(X_pred, df_pred, "predictTrypanossoma", 'XGBoost.pkl')
    # make_predictions(X_pred, df_pred, "predictTrypanossoma", 'SVM.pkl')
    # make_predictions(X_pred, df_pred, "predictTrypanossoma", 'RandomForest.pkl')


#XGB
# Test set accuracy: 0.9656798038845936
# Test set MCC: 0.6369697257695079
#SVM
# Test set accuracy: 0.961056285400996
# Test set MCC: 0.625858727404228
#Random Forest
# Test set accuracy: 0.9656588513839127
# Test set MCC: 0.6407444229073762