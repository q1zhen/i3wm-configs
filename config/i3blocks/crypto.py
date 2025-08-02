import argparse
import requests
import os

def get_ticker_info(symbol: str) -> dict:
	"""
	Fetch 24hr ticker information for the given symbol from Binance.
	"""
	url = f"https://api.binance.com/api/v3/ticker/24hr?symbol={symbol}"
	response = requests.get(url, timeout=10)
	response.raise_for_status()
	return response.json()

parser = argparse.ArgumentParser(
	description="Get current price and 24h growth for a Binance trading pair."
)
parser.add_argument(
	"symbol",
	type=str,
	help="Base symbol (e.g., BTC for BTCUSDT)."
)
parser.add_argument(
	"decimal",
	type=int,
	help="Number of decimal places for the price."
)

args = parser.parse_args()

base = args.symbol.upper()
decimal = args.decimal

button = os.getenv("BLOCK_BUTTON")
if button == "1":
	os.system(f"xdg-open https://www.okx.com/trade-spot/{base.lower()}-usdt")
pair = f"{base}USDT"
try:
	data = get_ticker_info(pair)
	price = float(data["lastPrice"])
	change_pct = float(data["priceChangePercent"])
	print(f"{base} ${price:,.{decimal}f} ({change_pct:.2f}%)")
	print(base)
	print("#a6e3a1" if change_pct > 0 else "#f38ba8")
except: pass
	# print(f"{base} ERROR")
	# print(base)
	# print("#9399b2")

