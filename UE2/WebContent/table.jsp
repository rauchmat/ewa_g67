<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="gameBean" class="at.ac.tuwien.big.easyholdem.game.Game" scope="session" />

<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="de">
	<head>
		<title>EWA Poker :: Tisch 1</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Pokertisch des EWA Poker Portals."/>
		<meta name="keywords" content="tisch EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
		<ul class="accessibility">
			<li><a href="#table" accesskey="0">Spielfeld</a></li>
			<li><a href="#navigation" accesskey="1">Navigation</a></li>
			<li><a href="#chips" accesskey="2" xml:lang="en">Chips</a></li>
			<li><a href="#news" accesskey="3" xml:lang="en">News</a></li>
			<li><a href="#probabilities" accesskey="4">Wahrscheinlichkeitstabelle</a></li>
		</ul>
		<div id="wrapper">
			<div id="header">
				<div id="teaser">

				</div>
				<h1>EWA Poker</h1>
			</div>
			<div id="body">
				<div id="infoborder"><p>Eingeloggt als <em xml:lang="en" >User Name</em>.</p></div>
				<div id="sidebar">
					<table id="chips">
						<tbody>
							<tr>
								<th colspan="2" xml:lang="en">Chips</th>
							</tr>
							<tr>
								<td>Im Pot</td>
								<td>5 &euro;</td>
							</tr>
							<tr>
								<td>Ante</td>
								<td>5 &euro;</td>
							</tr>
							<tr>
								<td>Ihr <span xml:lang="en">Stack</span></td>
								<td>105 &euro;</td>
							</tr>
						</tbody>
					</table>
					<hr class="accessibility" />
					<table id="probabilities">
						<tbody>
							<tr>
								<th colspan="2">Wahrscheinlichkeit</th>
							</tr>
							<tr>
								<td>Gewinn</td>
								<td>70,033%</td>
							</tr>
							<tr>
								<td xml:lang="en">Split</td>
								<td>43,887%</td>
							</tr>
							<tr>
								<td xml:lang="en">Pair</td>
								<td>10,998%</td>
							</tr>
							<tr>
								<td xml:lang="en">Two Pair</td>
								<td>2,33%</td>
							</tr>
							<tr>
								<td xml:lang="en">Three of a Kind</td>
								<td>0,337%</td>
							</tr>
							<tr>
								<td xml:lang="en">Straight</td>
								<td>20,332%</td>
							</tr>
							<tr>
								<td xml:lang="en">Flush</td>
								<td>12,223%</td>
							</tr>
							<tr>
								<td xml:lang="en">Full House</td>
								<td>0,777%</td>
							</tr>
							<tr>
								<td xml:lang="en">Four of a Kind</td>
								<td>0,301%</td>
							</tr>
							<tr>
								<td xml:lang="en">Straight Flush</td>
								<td>0,033%</td>
							</tr>
						</tbody>
					</table>
				</div>
					<hr class="accessibility" />
					<div id="main">
						<div id="navigation">
							<form method="post" action="Poker">
								<ul>
									<li><input type="submit" name="changeUserData" value="Userdaten &auml;ndern" accesskey="u" /></li>
									<li><input type="submit" name="newGame" value="Neues Spiel" accesskey="n" /></li>
									<li><input type="submit" name="logout" value="Ausloggen" accesskey="o" /></li>
								</ul>
							</form>
						</div>
						<div id="table">
							<div id="dealercards">
								<h2>Karten der Bank</h2>
								<span id="dealercard1" xml:lang="en">
									<img src="img/deck/bg.png" alt="croupier's cards: unknown" title="croupier's cards: unknown"/>
								</span>
								<span id="dealercard2" xml:lang="en">
									<img src="img/deck/bg.png" alt="croupier's cards: unknown" title="croupier's cards: unknown" />														 </span>
							</div>
							<div id="communitycards">
								<h2>Gemeinschaftskarten</h2>
								<span id="flop" xml:lang="en">
									<span id="flop1"><img src="img/deck/clubs-10.png" alt="Flop: 10 of clubs" title="Flop: 10 of clubs" /></span>
									<span id="flop2"><img src="img/deck/clubs-j.png" alt="Flop: Jack of clubs" title="Flop: Jack of clubs" /></span>
									<span id="flop3"><img src="img/deck/clubs-q.png" alt="Flop: Queen of clubs" title="Flop: Queen of clubs"/></span>
								</span>
								<span id="turn" xml:lang="en">
									<img src="img/deck/bg.png" alt="Turn: unkown" title="Turn: unknown" />
								</span>
								<span id="river" xml:lang="en">
									<img src="img/deck/bg.png" alt="River: unknown" title="River: unknown" />
								</span>
							</div>
							<div id="betboxes">
								<form action="#" method="post" id="moeglicheAktionen">
								<h2>Aktionen</h2>
								<p xml:lang="en"><input type="submit" value="Fold" accesskey="f" tabindex="1" /> <input type="submit" value="Check" accesskey="c" tabindex="2" /> <input type="submit" value="Bet" accesskey="b" tabindex="3" /></p>
								</form>
							</div>
							<div id="playercards">
								<h2>Ihre Karten</h2>
								<span id="playercard1" xml:lang="en">
									<img src="img/deck/clubs-k.png" alt="Your card: King of clubs" title="Your card: King of clubs" />
								</span>
								<span id="playercard2" xml:lang="en">
									<img src="img/deck/clubs-a.png" alt="Your card: Ace of clubs" title="Your card: Ace of clubs" />
								</span>
							</div>
							<div id="news">
								<ul>
									<li>+++ Neues Turnier am 23. Juni 1983 +++</li>
								</ul>
							</div>
						</div>
				</div>
			</div>
			<div id="footer">
				<p>&copy; 2008 EWA Poker.</p>
			</div>
		</div>
	</body>
</html>
