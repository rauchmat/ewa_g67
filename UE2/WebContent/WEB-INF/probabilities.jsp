<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat" %>
<jsp:useBean id="probabilityBean" class="at.ac.tuwien.big.easyholdem.probsim.HoldemProbability" scope="session" />

<% if(probabilityBean != null) { %>
<% DecimalFormat f = new DecimalFormat("###0.00"); %>
<table id="probabilities">
	<tbody>
		<tr>
			<th colspan="2">Wahrscheinlichkeit</th>
		</tr>
		<tr>
			<td>Gewinn</td>
			<td><%= f.format(probabilityBean.getWinningProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Split</td>
			<td><%= f.format(probabilityBean.getSplitPotProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Pair</td>
			<td><%= f.format(probabilityBean.getPairProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Two Pair</td>
			<td><%= f.format(probabilityBean.getTwoPairProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Three of a Kind</td>
			<td><%= f.format(probabilityBean.getThreeOfAKindProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Straight</td>
			<td><%= f.format(probabilityBean.getStraightProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Flush</td>
			<td><%= f.format(probabilityBean.getFlushProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Full House</td>
			<td><%= f.format(probabilityBean.getFullHouseProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Four of a Kind</td>
			<td><%= f.format(probabilityBean.getFourOfAKindProbability() * 100.0) %>%</td>
		</tr>
		<tr>
			<td xml:lang="en">Straight Flush</td>
			<td><%= f.format(probabilityBean.getStraightFlushProbability() * 100.0) %>%</td>
		</tr>
	</tbody>
</table>
<% } %>
