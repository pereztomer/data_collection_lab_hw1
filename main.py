import pandas as pd
from pandas_profiling import ProfileReport


def main():
    df = pd.read_csv('data/Cities.csv')

    profile = ProfileReport(df)
    profile


def merge_csvs():
    Bids = pd.read_csv('data/Bids.csv')
    Devices = pd.read_csv('data/Devices.csv')
    Imps = pd.read_csv('data/Imps.csv')

    Bids_Devices = pd.merge(Bids,
                            Devices,
                            on='DeviceID',
                            how='outer')

    Bids_Devices_Imps = pd.merge(Bids_Devices,
                                 Imps,
                                 on='ImpID',
                                 how='outer')

    Bids_Devices_Imps.to_csv('data/Bids_Devices_Imps.csv')


if __name__ == '__main__':
    merge_csvs()
