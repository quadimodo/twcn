package com.quadi.dao;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.quadi.entity.Users;

/**
 * A data access object (DAO) providing persistence and search support for Users
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.quadi.entity.Users
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class UsersDAO {
	private static final Logger log = LoggerFactory.getLogger(UsersDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String EMAIL = "email";
	public static final String TELPHONE = "telphone";
	public static final String NICKNAME = "nickname";
	public static final String GENDER = "gender";
	public static final String CITY = "city";
	public static final String AVATAR = "avatar";
	public static final String BIO = "bio";
	public static final String USTATE = "ustate";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Users transientInstance) {
		log.debug("saving Users instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Users persistentInstance) {
		log.debug("deleting Users instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Users findById(java.lang.Integer id) {
		log.debug("getting Users instance with id: " + id);
		try {
			Users instance = (Users) getCurrentSession().get(
					"com.quadi.entity.Users", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	//����username��password�ж��û���¼
	public Users findByUsername_pwd(String username,String pwd){
		String hql="from Users a where a.username=:username and a.password=:password ";
		Users users=(Users) sessionFactory.openSession().createQuery(hql).setString("username",username ).setString("password", pwd).uniqueResult();
		return users;
	}
	//�ж�username��email�Ƿ����
	public Users findByUsername_email(Users user){
		String hql="from Users a where a.username=:username or a.email=:email";
		Users users=(Users) sessionFactory.openSession().createQuery(hql).setString("username",user.getUsername() ).setString("email", user.getEmail()).uniqueResult();
		return users;
	}
	//�޸��û�����
	public int updateUnameEmail(Users user){
		
		String hql="update Users a set a.nickname=:nickname , a.email=:email where a.uid=:uid";
		int i=getCurrentSession().createQuery(hql).setString("nickname", user.getNickname()).setString("email", user.getEmail()).setInteger("uid", user.getUid()).executeUpdate();
		return i;
	}
	//��ѯ���ڹ�ע���ˣ�����huid��ѯusers��
/*	public List<?> findByHuid(Users users){
		String hql="from Users a where a.";
		getCurrentSession().saveOrUpdate(users)
		return null;
	}*/
	
	public List<Users> findByExample(Users instance) {
		log.debug("finding Users instance by example");
		try {
			List<Users> results = (List<Users>) getCurrentSession()
					.createCriteria("com.quadi.entity.Users")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Users instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Users as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Users> findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List<Users> findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List<Users> findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List<Users> findByTelphone(Object telphone) {
		return findByProperty(TELPHONE, telphone);
	}

	public List<Users> findByNickname(Object nickname) {
		return findByProperty(NICKNAME, nickname);
	}

	public List<Users> findByGender(Object gender) {
		return findByProperty(GENDER, gender);
	}

	public List<Users> findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List<Users> findByAvatar(Object avatar) {
		return findByProperty(AVATAR, avatar);
	}

	public List<Users> findByBio(Object bio) {
		return findByProperty(BIO, bio);
	}

	public List<Users> findByUstate(Object ustate) {
		return findByProperty(USTATE, ustate);
	}

	public List findAll() {
		log.debug("finding all Users instances");
		try {
			String queryString = "from Users";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Users merge(Users detachedInstance) {
		log.debug("merging Users instance");
		try {
			Users result = (Users) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Users instance) {
		log.debug("attaching dirty Users instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Users instance) {
		log.debug("attaching clean Users instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UsersDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UsersDAO) ctx.getBean("UsersDAO");
	}
}