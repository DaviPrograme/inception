
all:
	bash ./srcs/requirements/tools/make_dir.sh
	sudo ./srcs/requirements/tools/hosts_config.sh
	docker-compose -f ./srcs/docker-compose.yml up -d

clean: 
	docker system prune -a
	sudo rm -rf ~/data

fclean:
	./srcs/requirements/tools/stop_containers.sh
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data

re: fclean all

.PHONE: all clean fclean re 
