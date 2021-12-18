#!/usr/bin/env python3

# heavily inspired by https://github.com/kamek-pf/polybar-forecast

import requests
import os
import click
import json


API_CURRENT = 'http://api.openweathermap.org/data/2.5/weather'
API_FORECAST = 'http://api.openweathermap.org/data/2.5/forecast'
config = os.path.join(os.path.expanduser("~"), '.config', 'secret', 'weather.json')


icon_map = {
    '01d': '',
    '01n': '',
    '02d': '',
    '02n': '',
    "03d": '',
    "03n": '',
    "04d": '',
    "04n": '',
    "09d": '',
    "09n": '',
    "10d": '',
    "10n": '',
    "11d": '',
    "11n": '',
    "13d": '',
    "13n": '',
    "50d": '',
    "50n": '',
    'default': ''
}


def load_config():
    with open(config, 'r') as f:
        return json.load(f)


def fetch_weather(url, config):
    params = {
        'APPID': config['apiKey'],
        'id': config['locationID'],
        'units': config['units']
    }
    response = requests.get(url, params=params)
    return response.json()


def fetch_current(config):
    data = fetch_weather(API_CURRENT, config)

    icon = data['weather'][0]['icon']
    temperature = data['main']['temp']

    return f'{icon_map[icon]} {temperature}{config["displayUnit"]}'


def fetch_forecast(config):
    data = fetch_weather(API_FORECAST, config)
    # print(json.dumps(data['list'][0], indent=4))

    icon = data['list'][1]['weather'][0]['icon']
    temperature = data['list'][1]['main']['temp']

    return f'{icon_map[icon]} {temperature}{config["displayUnit"]}'


@click.group()
def cli():
    pass


@cli.command()
def short():
    config = load_config()
    current = fetch_current(config)
    forecast = fetch_forecast(config)

    out = f'{current}    {forecast}'
    print(out)


@cli.command()
@click.argument('time', required=False, default=None)
def rofi_forecast(time):
    config = load_config()
    data = fetch_weather(API_FORECAST, config)
    out = 'Tomorrow\n' + '\n'.join(
        [t['dt_txt'] + ':' + icon_map[t['weather'][0]['icon']] + ' ' + str(t['main']['temp']) + config['displayUnit'] for t in data['list']]
    )
    print(out)


if __name__ == '__main__':
    cli()

