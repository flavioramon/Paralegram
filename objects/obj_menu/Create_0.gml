image_speed = 0;
image_alpha = 0;

alpha = 0;

inicio = false;

#region tutoriais
tutorial = false;
lista_tutoriais = ds_list_create();

//nome do tutorial
//texto esquerda, 
//video, 
//texto direita

ds_list_add(lista_tutoriais, 
	//botao esquerdo (0)
	[
		"Movimentar Blocos",
		"Clique com o botão esquerdo do mouse para selecionar os blocos e arraste para movê-los.", 
		"tutorial_movimentar_blocos.mp4", 
		"Arraste os blocos para fora da área cinza claro quando quiser deletá-los."
	],
			
	//botao direito (1)
	[
		"Desvincular Blocos",
		"Clique com o botão direito do mouse sobre os blocos que deseja separar, em seguida arraste para movimentar.", 
		"tutorial_desvincular_blocos.mp4", 
		"Ao separar o bloco, os blocos abaixo dele o seguirão."
	],
			
	//bloco opcao (2)
	[
		"Blocos de Instruções",
		"Os 'Blocos de Instruções' (em laranja) podem ser inseridos dentro dos 'Blocos de Repetição' (em azul), basta encaixá-los na área dentro do bloco. Eles servem para decidir a ação que será tomada no jogo.",
		"tutorial_blocos_intrucoes.mp4",
		"Os 'Blocos de Instruções' também podem ser encaixados embaixo e em cima dos blocos azuis e deles mesmos (como visto no tutorial passado)."
	],
			
	//bloco quantidade 1 (3)
	[
		"Blocos de Variável",
		"Os 'Blocos de Variável' (em roxo) podem ser personalizados de acordo com a necessidade.",
		"tutorial_blocos_variavel.mp4",
		"Note que além do limite (1 a 10), certa fase não permite a personalização dos 'Blocos de Variável'."
	],
			
	//bloco quantidade 2 (4)
	[
		"Usar Variável",
		"Os 'Blocos de Variável' podem ser inseridos dentro dos 'Blocos de Repetição', na área delimitada.",
		"tutorial_usar_variavel.mp4",
		"Eles servem para decidir quantas repetições serão feitas pelos 'Blocos de Repetição'."
	],
			
	//scroll (5)
	[
		"Rolar Código",
		"Use o Scroll do mouse para subir e descer os blocos na tela.", 
		"tutorial_rolar_codigo.mp4", 
		"Apenas tenha cuidado para não perder os blocos de vista."
	],
			
	//botao simulacao (6)
	[
		"Botão Executar",
		"Clique no 'Botão Executar' para iniciar ou parar a simulação. A seta verde demonstra quais instruções estão sendo executadas na área cinza claro.", 
		"tutorial_botao_executar.mp4", 
		"É OBRIGATÓRIO parar a simulação para voltar a interagir com os blocos."
	],
			
	//botao resetar bloco (7)
	[
		"Botão Resetar",
		"Caso deseje apagar todos os blocos na área cinza claro, clique no 'Botão Resetar' para limpar a área. Após essa ação, uma janela de confirmação irá surgir.", 
		"tutorial_botao_resetar.mp4", 
		"Ao clicar no 'SIM' na janela de confirmação, todos os blocos serão apagados no editor definitivamente."
	],
	
	//botao tutorial (8)
	[
		"Botão Tutorial",
		"Caso deseje acessar os tutoriais novamente, basta clicar no 'Botão Tutorial' para escolher o tutorial que deseja assistir.", 
		"tutorial_botao_tutorial.mp4", 
		"É OBRIGATÓRIO parar a simulação para abrir os tutorias."
	],
	
	//botao de velocidade (9)
	[
		"Botão Velocidade",
		"Se você sentir a simulação muito devagar, você pode mudar a velocidade dela a qualquer momento.", 
		"tutorial_velocidade_animacao.mp4",
		"Basta clicar no 'Botão Velocidade' para alterar a velocidade da simulação, podendo mudar entre 1x, 2x e 4x."
	],
			
	//area verde (10)
	[
		"Área de Interação",
		"As áreas verdes são interativas, use conforme o objetivo da fase.", 
		"tutorial_area_interacao.mp4",
		"Note que nem todas as fases terão áreas verdes."
	]
);

tutorial_atual = -1;
qtd_tutoriais = ds_list_size(lista_tutoriais) - 1;

#endregion

//grafico
lista_graficos = noone;

mostrou_graficos = false;

//botoes
tam_b1 = 1;
tam_b2 = 1;
tam_b3 = 1;

x_botao1 = x;

x_botao2 = x;
y_botoes = y + 350;

//pontuacao
calculou_pontos = false;

criterios = noone

qtd_estrelas_fase = 0;
qtd_estrelas_na_tela = 0;