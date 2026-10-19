global.game_speed = 1

global.sel = noone;
global.simulacao = false;
global.qtd_container_fase4 = 0;

global.menu_inicio_fase = false;
global.menu_fim_fase = false;

global.lista_conjunto_bloco = ds_list_create();

global.pontuacao_fase = 0;
global.pontuacao_total = 0;

global.fase3_cor = "amarelo";
global.fase3_qtd_entregue = 0;

global.fase4_qtd_amarelo_pegos = 0;
global.fase4_qtd_azul_pegos = 0;
global.fase4_qtd_vermelho_pegos = 0;

//mapa do json
global.map_json = ds_map_create();

//pegando o nome
id_async_nome = -1;

inseriu_nome = false;

if (room == rm_inicial) id_async_nome = get_string_async("Digite o seu primero nome:", "");

ex_x_mouse = 0;
ex_y_mouse = 0;

sim_seg = 0;
sim_min = 0;
sim_hor = 0;

//mapa com informacoes
lista_sim = ds_list_create();

//tempo 1 processador
tempo_1_gan = 54; //162.97

//informacoes das fases
fase_info = [
	{
		sprite: spr_explicacao_fase1, 
		nome: "Fase 1\nParticionamento", 
		habilidade: "O jogador deve desenvolver a habilidade de decomposição, ao interagir com a carga separando as caixas por cor em paletes específicos.\n\nA separação uma a uma permite exercitar a competencia do reconhecimento de padrões e a aplicação prática da decomposição, conforme identifica a semelhança visuais e categoriza os objetos.\n\nAo final desta etapa, o jogador irá visualizar estratégias de divisão de dados com base no domínio ou funções.",
		objetivo: "Objetivo:\n\nOrganizar as caixas espalhadas no galpão, separando-as por cor em paletes.\n\nCada cor representa um destino diferente.\n\nA organização é manual, e o operador deve garantir que tudo esteja pronto para a empilhadeira carregar corretamente os caminhões.",
	},
	{
		sprite: spr_explicacao_fase2,
		nome: "Fase 2\nComunicação", 
		habilidade: "Focando na habilidade de abstração aplicada à comunicação entre as empilhadeiras, a missão é evitar colisões e garantir que as cargas classificadas sejam alocadas corretamente nos caminhões.\n\nAo avaliar o momento apropriado para estabelecar a comunicação entre os agentes, reduzindo movimentos desnecessários.\n\nA dinâmica exige o uso do reconhecimento de padrões de movimentação e a reutilização desses padrões por meio de comandos programados.\n\nDeste modo, a fase contribui para o desenvolvimento da capacidade de abstrair comportamentos repetitivos e otimizar interações em ambientes.",
		objetivo: "Objetivo:\n\nAgora que as caixas já estão nos paletes por cor, é hora de coordenar as empilhadeiras.\n\nElas precisam carregar os caminhões certos sem se atrapalhar.\n\nUse uma estratégia eficiente para evitar acidentes e garantir que cada carga vá para o destino correto, com o mínimo de confusão no pátio."
	},
	{
		sprite: spr_explicacao_fase3, 
		nome: "Fase 3\nAglomeração", 
		habilidade: "Neste desafio, o exercício da abstração da orgranização dos agrupamentos de contêiners, classifacando os semelhantes.\n\nDesevolvendo um algoritmo que possa organizar os lotes de forma eficiente, com base nas cores.\n\nNovamente a habilidade de reconhecimento de padrões será explorada para identificar sequências de movimentos que se repetem.\n\nAlém disso, essa etapa exige que todos os movimentos sejam planejados previamente, estimulando a competência de organizar tarefas complexas a partir de regras simples e estruturadas.",
		objetivo: "Objetivo:\n\nCom os containers carregados, agora eles precisam ser levados ao pátio do porto e organizados em pilhas por destino.\n\nO jogador deve planejar bem os movimentos das empilhadeiras de containers para evitar tempo perdido e garantir uma logística eficiente."
	},
	{
		sprite: spr_explicacao_fase4, 
		nome: "Fase 4\nMapeamento", 
		habilidade: "Agora deve-se aprimorar a habilidade de mapeamento e compreensão do balanceamento de carga, ao planejar o transporte dos contêineres do pátio para o navio, utilizando guindastes como unidades de processamento.\n\nO usuário poderá verificar a alocação das tarefas entre multiplos núcleos de execução (guinchos) de forma equilibrada, evitando sobrecarga ou ociosidade.\n\nCom isso, é possível avaliar as vantagens e limitações da execução paralela, entendendo os impactos do aumento do número de núcleos sobre o desempenho de algoritmos em ambientes paralelizados.",
		objetivo: "Objetivo:\n\nO navio chegou e está pronto para receber os containers.\n\nA missão é usar guindastes portuários para içar os containers e colocá-los a bordo na ordem certa de entrega.\n\nA cor dos containers continua sendo fundamental para essa organização.\n\nVocê deverá executar o código com um guincho, dois guinchos e com três guinchos, para comparar a velocidade do paralelismo."
	},
];
