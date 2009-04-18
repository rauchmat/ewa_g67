<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<jsp:useBean id="gameBean" class="at.ac.tuwien.big.easyholdem.game.Game" scope="session" />

<table id="chips">
	<tbody>
		<tr>
			<th colspan="2" xml:lang="en">Chips</th>
		</tr>
		<tr>
			<td>Im Pot</td>
			<td><%= gameBean.getPotSize() %> &euro;</td>
		</tr>
		<tr>
			<td>Ante</td>
			<td><%= gameBean.getFixedBetSize() %> &euro;</td>
		</tr>
		<tr>
			<td>Ihr <span xml:lang="en">Stack</span></td>
			<td><%= gameBean.getPlayer().getStack() %> &euro;</td>
		</tr>
	</tbody>
</table>