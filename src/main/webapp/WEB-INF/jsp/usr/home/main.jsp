<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="px-56 py-10">
	<div class="grid grid-cols-4 gap-10 text-center">
		<!-- 팀리그 -->
		<a href="${pageContext.request.contextPath}/usr/team/reservation"
			class="flex flex-col items-center transition">
			<div>
				<img src="https://j.gifs.com/pZ9zQX.gif" alt="팀리그"
					class="h-20 w-20 object-cover rounded-lg">
			</div>
			<p>구장 예약</p>
		</a>

		<!-- 팀원 모집 -->
		<a href="${pageContext.request.contextPath}/usr/team/rankings"
			class="flex flex-col items-center transition">
			<div>
				<img src="https://j.gifs.com/K8A6Zl.gif" alt="팀원 모집"
					class="h-20 w-20 object-cover rounded-lg">
			</div>
			<p>팀 리그</p>
		</a>

		<!-- 게스트 모집 -->
		<a href="${pageContext.request.contextPath}/usr/team/teamList"
			class="flex flex-col items-center transition"> <img
			src="https://j.gifs.com/Z8ZWV2.gif" alt="게스트 모집"
			class="h-20 w-20 object-cover rounded-lg">

			<p class="mt-3 text-gray-800">팀 찾기</p>
		</a>

		<!-- 팀 만들기 -->
		<a href="${pageContext.request.contextPath}/team/create"
			class="flex flex-col items-center transition">
			<div>
				<img src="https://j.gifs.com/46W9Rg.gif" alt="팀 만들기"
					class="h-20 w-20 object-cover rounded-lg">
			</div>
			<p>팀 매칭</p>
		</a>
	</div>
</section>



<section class="px-96 py-5 bg-gray-100">
	<h2 class="text-center text-4xl font-bold mb-8">| 이달의 선수 |</h2>
	<div class="container mx-auto flex flex-row gap-8">
		<!-- 선수 사진 영역 -->
		<div class="playerBox flex-1 flex justify-center overflow-x-hidden">
			<svg class='playerList' viewBox='0 0 750 200' width='700px'
				height='200px'>
        <defs>
          <clipPath id='clipS'>
            <rect width='200' height='200' rx='50' ry='10' />
          </clipPath>
          <clipPath id='clipR'>
            <rect x='275' width='200' height='200' rx='50' ry='10' />
          </clipPath>
          <clipPath id='clipP'>
            <rect x='550' width='200' height='200' rx='50' ry='10' />
          </clipPath>
          <filter id='shadow'>
            <feGaussianBlur in='SourceAlpha' stdDeviation='2'
					result='flou' />
            <feOffset in='flou' dx='2' dy='2' result='shad' />
            <feMerge>
              <feMergeNode in='shad' />
              <feMergeNode in='SourceGraphic' />
            </feMerge>
          </filter>
          <filter id='grayscale'>
            <feColorMatrix id='matrixFilter' type='matrix'
					values='0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 .4 0' />
          </filter>
        </defs>
        <image id='imageSilva' class='grayscale otherPlayer silva'
					xlink:href='//upload.wikimedia.org/wikipedia/commons/b/b8/20141118_1838_AUTBRA_4935.jpg'
					width='200' height='200' preserveAspectRatio='xMidYMin slice'
					style='clip-path:url(#clipS)' />
        <image id='imageRonaldo' class='grayscale otherPlayer ronaldo'
					xlink:href='//upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/440px-Cristiano_Ronaldo_2018.jpg'
					x='275' width='200' height='200'
					preserveAspectRatio='xMidYMin slice' style='clip-path: url(#clipR)' />
        <image id='imagePogba' class='grayscale otherPlayer pogba'
					xlink:href='//upload.wikimedia.org/wikipedia/commons/thumb/f/fc/FRA-ARG_%2811%29_-_Paul_Pogba_%28cropped%29.jpg/440px-FRA-ARG_%2811%29_-_Paul_Pogba_%28cropped%29.jpg'
					x='550' width='200' height='200'
					preserveAspectRatio='xMidYMin slice' style='clip-path:url(#clipP)' />
      </svg>
		</div>

		<!-- 선수 능력치 영역 -->
		<div class="player w-1/2 flex flex-col items-center overflow-x-hidden">
			<svg class="chartInfos" viewBox="0 0 250 250" width="300%"
				height="210px">
        <text x="125" y="9" class="text-lg font-semibold">atk</text>
        <text class="textStats" x="125" y="22">0</text>
        <text x="230" y="60" class="text-lg font-semibold">skl</text>
        <text class="textStats" x="225" y="75">0</text>
        <text x="230" y="200" class="text-lg font-semibold">mov</text>
        <text class="textStats" x="225" y="185">0</text>
        <text x="125" y="250" class="text-lg font-semibold">pow</text>
        <text class="textStats" x="125" y="237">0</text>
        <text x="20" y="200" class="text-lg font-semibold">mtl</text>
        <text class="textStats" x="25" y="185">0</text>
        <text x="20" y="60" class="text-lg font-semibold">def</text>
        <text class="textStats" x="25" y="75">0</text>
        <!-- 능력치 그래프 SVG 크기 조절 -->
        <svg id="chart" viewBox="0 0 200 200" width="200px"
					height="200px" x="25" y="25">
          <g id="grid"
						style="stroke:hsla(0, 100%, 100%, 0.5); stroke-width: 1;">
            <defs>
              <polygon id="polygon"
						points="100,100 100,100 100,100 100,100 100,100 100,100" />
              <marker style="fill:red;" id="markerCircle"
						markerWidth="4" markerHeight="4" refX="2" refY="2">
                <circle cx="2" cy="2" r="2"
						style="stroke:none; fill:hsla(180, 70%, 70%, 1)" />
              </marker>
            </defs>
            
            <!-- Hexagon grid lines -->
            <line id="l1" x1="100" y1="0" x2="100" y2="200"
						style="stroke:inherit" />
            <line id="l2" x1="100" y1="0" x2="100" y2="200"
						style="stroke:inherit; transform-origin: 50% 50%; transform: rotate(60deg)" />
            <line id="l3" x1="100" y1="0" x2="100" y2="200"
						style="stroke:inherit; transform-origin: 50% 50%; transform: rotate(-60deg)" />
            
            <!-- Nested polygons for grid effect -->
            <use xlink:href="#polygon" id="p1" />
            <use xlink:href="#polygon" id="p2"
						style="transform: translate(25px, 25px) scale(.75)" />
            <use xlink:href="#polygon" id="p3"
						style="transform: translate(50px, 50px) scale(.5)" />
            <use xlink:href="#polygon" id="p4"
						style="transform: translate(75px, 75px) scale(.25)" />
          </g>
        </svg>
      </svg>
		</div>
	</div>
</section>











<script>
	function Player(options) {
		this.averageStats = [];
		this.infos = options.infos;
		this.stats = options.stats;
	}

	Player.prototype.averageCategoryStats = function averageStats(category) {
		var ar = [];
		for ( var i in this.stats[category]) {
			ar.push(this.stats[category][i]);
		}
		var total = ar.reduce(function(prev, stat) {
			return (prev + stat);
		});
		return Math.round(total / ar.length);
	};

	// Chart manipulation
	var polygon = document.getElementById('polygon'), r = 100, sin30 = 1 / 2, cos30 = Math
			.sqrt(3) / 2, Points = {
		x : [ 1, 1 + cos30, 1 + cos30, 1, 1 - cos30, 1 - cos30 ],
		y : [ 0, sin30, 1 + sin30, 2, 1 + sin30, sin30 ],
	}, playerPoints = {
		x : [ 0, cos30, cos30, 0, -cos30, -cos30 ],
		y : [ 0, -sin30, sin30, 1, sin30, -sin30 ],
	};

	for (var i = 0; i < polygon.points.numberOfItems; i++) {
		polygon.points.getItem(i).x = Points.x[i] * r;
		polygon.points.getItem(i).y = Points.y[i] * r;
	}

	var svg = document.getElementById('chart'), playerHexagon = document
			.createElementNS('http://www.w3.org/2000/svg', 'polygon');

	playerHexagon.setAttribute('id', 'playerHexagon');
	playerHexagon.setAttribute('points',
			'100,100 100,100 100,100 100,100 100,100 100,100');
	playerHexagon
			.setAttribute(
					'style',
					'stroke:hsla(180, 70%, 70%, 1); fill:hsla(180, 70%, 70%, .5); marker-start: url(#markerCircle); marker-mid: url(#markerCircle);');
	svg.appendChild(playerHexagon);

	var ronaldo = new Player(
			{
				infos : {
					photo : '//sport.niooz.fr/cache/mediaurl/600x200/8c4a7b8e5efe12a51e8e2e00491d37c8.jpg',
					name : 'Cristiano Ronaldo',
					team : 'Real Madrid FC',
					age : 31,
					nation : 'Portugal',
					position : 'Forward',
					foot : 'Right',
				},
				stats : {
					attacking : {
						'Crossing' : 82,
						'Finishing' : 95,
						'Heading Accuracy' : 86,
						'Short Passing' : 81,
						'Volleys' : 87,
					},
					skill : {
						'Dribbling' : 93,
						'Curve' : 88,
						'Free Kick Accuracy' : 77,
						'Long Passing' : 72,
						'Ball Control' : 91,
					},
					movement : {
						'Acceleration' : 91,
						'Sprint Speed' : 93,
						'Agility' : 90,
						'Reactions' : 92,
						'Balance' : 62,
					},
					power : {
						'Shot Power' : 94,
						'Jumping' : 94,
						'Stamina' : 90,
						'Strength' : 79,
						'Long Shots' : 93,
					},
					mentaly : {
						'Aggression' : 62,
						'Interceptions' : 29,
						'Positioning' : 93,
						'Vision' : 81,
						'Penalties' : 85,
					},
					defending : {
						'Marking' : 22,
						'Standing Tackle' : 31,
						'Sliding Tackle' : 23,
					}
				}
			});

	// T.Silva creation
	var silva = new Player(
			{
				infos : {
					photo : '//www.footmercato.net/images/a/thiago-silva-fait-l-eloge-de-pogba_150564.jpg',
					name : 'Thiago Silva',
					team : 'Paris Saint-Germain',
					age : 30,
					nation : 'Brazil',
					position : 'Center-back',
					foot : 'Right',
				},
				stats : {
					attacking : {
						'Crossing' : 60,
						'Finishing' : 38,
						'Heading Accuracy' : 82,
						'Short Passing' : 79,
						'Volleys' : 63,
					},
					skill : {
						'Dribbling' : 68,
						'Curve' : 61,
						'Free Kick Accuracy' : 73,
						'Long Passing' : 81,
						'Ball Control' : 80,
					},
					movement : {
						'Acceleration' : 72,
						'Sprint Speed' : 76,
						'Agility' : 75,
						'Reactions' : 84,
						'Balance' : 68,
					},
					power : {
						'Shot Power' : 78,
						'Jumping' : 93,
						'Stamina' : 74,
						'Strength' : 81,
						'Long Shots' : 71,
					},
					mentaly : {
						'Aggression' : 77,
						'Interceptions' : 91,
						'Positioning' : 59,
						'Vision' : 74,
						'Penalties' : 71,
					},
					defending : {
						'Marking' : 90,
						'Standing Tackle' : 91,
						'Sliding Tackle' : 89,
					}
				}
			});

	// Pogba Creation
	var pogba = new Player(
			{
				infos : {
					photo : '//cdn.images.express.co.uk/img/dynamic/67/590x/Paul-Pogba-602242.jpg',
					name : 'Paul Pogba',
					team : 'Juventus FC',
					age : 22,
					nation : 'France',
					position : 'Centre midfield',
					foot : 'Right',
				},
				stats : {
					attacking : {
						'Crossing' : 76,
						'Finishing' : 70,
						'Heading Accuracy' : 72,
						'Short Passing' : 85,
						'Volleys' : 84,
					},
					skill : {
						'Dribbling' : 88,
						'Curve' : 82,
						'Free Kick Accuracy' : 80,
						'Long Passing' : 81,
						'Ball Control' : 89,
					},
					movement : {
						'Acceleration' : 75,
						'Sprint Speed' : 79,
						'Agility' : 75,
						'Reactions' : 86,
						'Balance' : 61,
					},
					power : {
						'Shot Power' : 91,
						'Jumping' : 85,
						'Stamina' : 90,
						'Strength' : 91,
						'Long Shots' : 91,
					},
					mentaly : {
						'Aggression' : 80,
						'Interceptions' : 71,
						'Positioning' : 83,
						'Vision' : 86,
						'Penalties' : 76,
					},
					defending : {
						'Marking' : 71,
						'Standing Tackle' : 77,
						'Sliding Tackle' : 83,
					}
				}
			});

	var currentPlayerAllStats = [ 0, 0, 0, 0, 0, 0 ], newPlayerAllStats = [ 0,
			0, 0, 0, 0, 0 ], otherPlayer = document
			.getElementsByClassName('otherPlayer'), otherPlayerArray = Array.prototype.slice
			.call(otherPlayer), playerLine = document
			.getElementsByClassName('playerLine'), playerLineArray = Array.prototype.slice
			.call(playerLine);

	otherPlayerArray.forEach(function(player) {
		player.addEventListener('click', runStats);
		player.addEventListener('mouseenter', displayName);
		player.addEventListener('mouseleave', displayName);
	});

	// This below function is so dirty and repetitive, I should refactor it
	function displayName(event) {
		playerLineArray.forEach(function(line) {
			if (event.target.classList.contains('silva')) {
				if (line.classList.contains('silva')) {
					line.classList.toggle('playerLineShow');
				}
			} else if (event.target.classList.contains('ronaldo')) {
				if (line.classList.contains('ronaldo')) {
					line.classList.toggle('playerLineShow');
				}
			} else if (event.target.classList.contains('pogba')) {
				if (line.classList.contains('pogba')) {
					line.classList.toggle('playerLineShow');
				}
			}
		});

		otherPlayerArray.forEach(function(el) {
			if (el.classList.contains('playerName')) {
				if (event.target.classList.contains('silva')
						&& el.classList.contains('silva')) {
					event.type == 'mouseleave' ? el.classList
							.add('transparent') : el.classList
							.remove('transparent');
				}
				if (event.target.classList.contains('ronaldo')
						&& el.classList.contains('ronaldo')) {
					event.type == 'mouseleave' ? el.classList
							.add('transparent') : el.classList
							.remove('transparent');
				}
				if (event.target.classList.contains('pogba')
						&& el.classList.contains('pogba')) {
					event.type == 'mouseleave' ? el.classList
							.add('transparent') : el.classList
							.remove('transparent');
				}
			}
		});
	}

	function runStats(event) {
		if (event.target.classList.contains('silva')) {
			newPlayerAllStats = silva.averageStats;
			removeFilter('imageSilva');
		} else if (event.target.classList.contains('ronaldo')) {
			newPlayerAllStats = ronaldo.averageStats;
			removeFilter('imageRonaldo');
		} else if (event.target.classList.contains('pogba')) {
			newPlayerAllStats = pogba.averageStats;
			removeFilter('imagePogba');
		}
	}

	var playerImages = document.getElementsByTagName('image'), playerImagesArray = Array.prototype.slice
			.call(playerImages);

	function removeFilter(playerImage) {
		playerImagesArray.forEach(function(image) {
			image.id == playerImage ? image.classList.remove('grayscale')
					: image.classList.add('grayscale');
		})
	}

	/**
	 * Draw the new playerHexagon points
	 * @param {Array} player stats (e.g. 'ronaldo.averageStats')
	 **/
	function drawPlayerStats(playerStats) {
		for (var i = 0; i < playerHexagon.points.numberOfItems; i++) {
			playerHexagon.points.getItem(i).x = r + playerPoints.x[i]
					* playerStats[i];
			if (i === 0) {
				playerHexagon.points.getItem(i).y = r - playerStats[i];
			} else {
				playerHexagon.points.getItem(i).y = r + playerPoints.y[i]
						* playerStats[i];
			}
		}
	}

	function getPlayerStats(player) {
		for ( var category in player.stats) {
			player.averageStats.push(player.averageCategoryStats(category));
		}
	}

	var textStats = document.getElementsByClassName('textStats'), textStatsArray = Array.prototype.slice
			.call(textStats);

	function anim() {
		currentPlayerAllStats
				.forEach(function(element, index) {
					if (currentPlayerAllStats[index] > newPlayerAllStats[index]) {
						currentPlayerAllStats[index]--;
						textStatsArray[index].textContent -= 1;
					} else if (currentPlayerAllStats[index] < newPlayerAllStats[index]) {
						currentPlayerAllStats[index]++;
						textStatsArray[index].textContent = Number(textStatsArray[index].textContent) + 1;
					}
				});
		drawPlayerStats(currentPlayerAllStats);
		window.requestAnimationFrame(anim);
	}

	getPlayerStats(ronaldo);
	getPlayerStats(silva);
	getPlayerStats(pogba);
	anim();
</script>



<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
