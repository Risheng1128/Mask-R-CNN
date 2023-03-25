# workpiece excel information
layer_header = ['layer']
feature_header = ['energy', 'entropy', 'contrast', 'idm', 'autocorrelation',
                  'mean_x', 'mean_y', 'variance_x', 'variance_y',
                  'standard_deviation_x', 'standard_deviation_y',
                  'correlation', 'dissimilarity']

# material property excel information
trail_header = ['trail']
error_data = 'X'

# output excel information
output_header = ['prediction', 'true', 'error(%)', 'train number',
                 'test number', 'feature numebr', 'remove feature',
                 'R2 score', 'MSE', 'MAE']
xgboost_header = ['n estimator', 'learning rate', 'max depth']
lightgbm_header = ['boosting type', 'num leaves', 'learning rate', 'max depth']
logistic_header = ['max iter', 'random state']
svr_header = ['C', 'kernel', 'gamma']

# dictionary key
tensile_key = ['tensile']
pmb_key = ['pmb_50Hz', 'pmb_200Hz', 'pmb_400Hz', 'pmb_800Hz']
iron_key = ['iron_50Hz', 'iron_200Hz', 'iron_400Hz', 'iron_800Hz']
