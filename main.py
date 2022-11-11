import pandas as pd
from pandas_profiling import ProfileReport

def main():
    df = pd.read_csv('data/Cities.csv')

    profile = ProfileReport(df)
    profile


if __name__ == '__main__':
    main()
