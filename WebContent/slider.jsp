<div align="center">
				
				<img src="images/OOty/ooty_1.jpg" id="slide" width="560" height="420" />
				<script type="text/javascript">
				var step=0;
				function slideit()
				{
			 	if (!document.images)
  				return; 
  				document.getElementById('slide').src = slideimages[step].src;
 				
 				if (step<4)
  				step++;
 				else
  				step=0;
 
 			setTimeout("slideit()",2000);
				}

		slideit();

</script>
</div>