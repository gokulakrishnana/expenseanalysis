<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/dist/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="scripts/dist/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="scripts/dist/plugins/jqplot.donutRenderer.min.js"></script>

<!-- <script type="text/javascript" src="scripts/dist/plugins/jqplot.highlighter.min.js"></script> -->
<script type="text/javascript" src="scripts/dist/plugins/jqplot.cursor.min.js"></script>
<script type="text/javascript" src="scripts/dist/plugins/jqplot.dateAxisRenderer.min.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet/jquery.jqplot.min.css">
<link rel="stylesheet" type="text/css" href="stylesheet/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css" />
<link rel="stylesheet" type="text/css" href="stylesheet/tables-style.css">


</head>
<body>

<div id="end">Expense Analysis System</div>


	
		
		<br>
		<div id="chart_ " style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_BANKINT = [[20.0,2015-01-01]
		

		
		];
		<br>
		plot_BANKINT = $.jqplot('chart_BANKINT', [line_BANKINT], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_BANKINT" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_BSNL = [[812.0,2015-01-02]
		

		
		];
		<br>
		plot_BSNL = $.jqplot('chart_BSNL', [line_BSNL], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_BSNL" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_CABLE-DTH = [[2070.0,2015-01-02]
		

		
	,[1260.0,2015-01-06]
	
	

		
		];
		<br>
		plot_CABLE-DTH = $.jqplot('chart_CABLE-DTH', [line_CABLE-DTH], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_CABLE-DTH" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_GROCERY = [[174.0,2015-01-03]
		

		
	,[217.0,2015-01-03]
	
	

		
	,[3617.0,2015-01-03]
	
	

		
	,[640.0,2015-01-02]
	
	

		
	,[193.0,2015-01-05]
	
	

		
		];
		<br>
		plot_GROCERY = $.jqplot('chart_GROCERY', [line_GROCERY], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_GROCERY" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_HEALTH = [[988.0,2015-01-03]
		

		
		];
		<br>
		plot_HEALTH = $.jqplot('chart_HEALTH', [line_HEALTH], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_HEALTH" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_MISC-EXP = [[3700.0,2015-01-09]
		

		
	,[11675.0,2015-01-10]
	
	

		
		];
		<br>
		plot_MISC-EXP = $.jqplot('chart_MISC-EXP', [line_MISC-EXP], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_MISC-EXP" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_MISC-REFUND = [[20000.0,2015-01-06]
		

		
		];
		<br>
		plot_MISC-REFUND = $.jqplot('chart_MISC-REFUND', [line_MISC-REFUND], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_MISC-REFUND" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_MOBILE = [[197.0,2015-01-01]
		

		
		];
		<br>
		plot_MOBILE = $.jqplot('chart_MOBILE', [line_MOBILE], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_MOBILE" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_SAVING = [[5000.0,2015-01-07]
		

		
	,[15000.0,2015-01-07]
	
	

		
		];
		<br>
		plot_SAVING = $.jqplot('chart_SAVING', [line_SAVING], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_SAVING" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_SHAREKHAN = [[2500.0,2015-01-08]
		

		
	,[2000.0,2015-01-01]
	
	

		
		];
		<br>
		plot_SHAREKHAN = $.jqplot('chart_SHAREKHAN', [line_SHAREKHAN], {
		title:'Data Point Highlighting',
      axes:{
        xaxis:{
          renderer:$.jqplot.DateAxisRenderer,
          tickOptions:{
            formatString:'%b&nbsp;%#d'
          } 
        },
        yaxis:{
          tickOptions:{
            formatString:'$%.2f'
            }
        }
      },
      highlighter: {
        show: true,
        sizeAdjust: 7.5
      },
      cursor: {
        show: false
      }
  });
});
</script>		
		
		
		<br>
		<div id="chart_SHAREKHAN" style="height:300px;width:600px;"></div>
		<script>
		$(document).ready(function(){
		<br>
 		var line_TNEB = [[197.0,2015-01-01]
		

		
	,[2070.0,2015-01-02]
	
	

		
	,[640.0,2015-01-02]
	
	

		
	,[812.0,2015-01-02]
	
	

		
	,[460.0,2015-01-02]
	
	
]
 		plot_TNEB = $.jqplot('chart_TNEB', [line_TNEB], {
 			title:'Data Point Highlighting',
 	      axes:{
 	        xaxis:{
 	          renderer:$.jqplot.DateAxisRenderer,
 	          tickOptions:{
 	            formatString:'%b&nbsp;%#d'
 	          } 
 	        },
 	        yaxis:{
 	          tickOptions:{
 	            formatString:'$%.2f'
 	            }
 	        }
 	      },
 	      highlighter: {
 	        show: true,
 	        sizeAdjust: 7.5
 	      },
 	      cursor: {
 	        show: false
 	      }
 	  });
 	});
 	</script>	



</body>
</html>