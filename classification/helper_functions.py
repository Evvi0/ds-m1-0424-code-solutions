from IPython.display import Markdown, display
import pandas as pd
import numpy as np
np.random.seed(42)
rng = np.random.default_rng(42)
import matplotlib.pyplot as plt
import seaborn as sns
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from xgboost import XGBClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import roc_auc_score, roc_curve

def grid_train_random_forest(X, y, params, n_folds, eval_metric):
    """
    Train Random Forest binary classifier using a grid of hyperparameters. Return
    the best model according to the specified metric.

    Args:
        X: Array-like of shape (n_samples,n_features) - Test feature data.
        y: Array-like of shape (n_samples,) - Test target data.
        params: Dictionary - Parameter grid on which to perform cross validation.
        n_folds: int - Number of folds to use for cross validation.
        eval_metric: str - Metric to use for evaluating model performance in cross validation.

    Returns:
        model: Best Random Forest model according to evaluation metric.

    Examples:
        model = grid_train_random_forest(X, y, params, 4, "accuracy")
    """

    # TODO: Implement this function
def grid_train_random_forest(X, y, params, n_folds = 4, eval_metric = 'accuracy'):
    random_search = GridSearchCV(RandomForestClassifier(), params, cv=n_folds, scoring=eval_metric)
    random_search.fit(X, y)
    model = random_search.best_estimator_

def calc_roc_metrics(X, y, model):
    """
    Calculate False Positive Rate (FPR), True Positive Rate (TPR), and Area Under ROC Curve (AUC)
    for a given binary classification model and test data.

    Args:
        X: Array-like of shape (n_samples,n_features) - Test feature data.
        y: Array-like of shape (n_samples,) - Test target data.
        model: Scikit-learn style binary classification model.

    Returns:
        fpr: float - False Positive Rate.
        tpr: float - True Positive Rate.
        auc: float - Area Under ROC Curve.

    Examples:
        fpr, tpr, auc = calc_roc_metrics(X, y, model)
    """

    # TODO: Implement this function
    y = y.replace({'Yes': 1, 'No': 0})
    y_pred = model.predict_proba(X)[:, 1]
    fpr, tpr, _ = roc_curve(y, y_pred)
    auc = roc_auc_score(y, y_pred)
    return fpr, tpr, auc

def train_xgboost(X_train, y_train, X_test, y_test, params, n_round):
    """
    Train an XGBoost model with the given parameters and train/test data.

    Args:
        X_train: Array-like of shape (n_train_samples,n_features) - Train feature data.
        y_train: Array-like of shape (n_train_samples,) - Train target data.
        X_test: Array-like of shape (n_test_samples,n_features) - Test feature data.
        y_test: Array-like of shape (n_test_samples,) - Test target data.
        params: Dictionary - Parameters to pass into XGBoost trainer.
        n_round: int - Number of rounds of training.

    Returns:
        model: Trained XGBoost model.

    Examples:
        model = calc_roc_metrics(X_train, y_train, X_test, y_test, params)
    """

    # TODO: Implement this function
    y_train = y_train.apply(lambda x: 1 if x == 'Yes' else 0)
    y_test = y_test.apply(lambda x: 1 if x == 'Yes' else 0)
    xgb = XGBClassifier(random_state=1)
    xgb.fit(X_train, y_train, eval_set = [(X_test, y_test)])
    return xgb
