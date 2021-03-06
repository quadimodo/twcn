package com.quadi.dao;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.quadi.entity.Tweets;
import com.quadi.entity.Users;

/**
 * A data access object (DAO) providing persistence and search support for
 * Tweets entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.quadi.entity.Tweets
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class TweetsDAO {
	private static final Logger log = LoggerFactory.getLogger(TweetsDAO.class);
	// property constants
	public static final String TCONTENT = "tcontent";
	public static final String TSTATE = "tstate";

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

	//根据用户id查询推特数目
	public long findByUid(Users user){
		String hql="select count(*) from Tweets a where a.users.uid=:uid";
		long i=(Long) sessionFactory.openSession().createQuery(hql).setInteger("uid", user.getUid()).uniqueResult();
		return i;
	}
	//根据用户id查询关注人的推特
	public List<?> findTweetByUid(Users user,int currentpage){
		String hql="from Tweets a where a.users.uid in (select a.usersBySuid.uid from Relationships a where a.usersByHuid=:uid) order by a.tweettime desc";
		List<?> list=sessionFactory.openSession().createQuery(hql).setInteger("uid", user.getUid()).setFirstResult((currentpage-1)*5).setMaxResults(5).list();                       
		return list;
	}
	
	
	//根据推特id查询本推特的图片
	public List<?> findPicByTweets(Tweets tweets){
		String hql="from T2p a where a.tweets.tid=:tid";
		List<?> list=getCurrentSession().createQuery(hql).setInteger("tid", tweets.getTid()).list();
		return list;
	}
	public void save(Tweets transientInstance) {
		log.debug("saving Tweets instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Tweets persistentInstance) {
		log.debug("deleting Tweets instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Tweets findById(java.lang.Integer id) {
		log.debug("getting Tweets instance with id: " + id);
		try {
			Tweets instance = (Tweets) getCurrentSession().get(
					"com.quadi.dao.Tweets", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Tweets> findByExample(Tweets instance) {
		log.debug("finding Tweets instance by example");
		try {
			List<Tweets> results = (List<Tweets>) getCurrentSession()
					.createCriteria("com.quadi.dao.Tweets")
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
		log.debug("finding Tweets instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Tweets as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Tweets> findByTcontent(Object tcontent) {
		return findByProperty(TCONTENT, tcontent);
	}

	public List<Tweets> findByTstate(Object tstate) {
		return findByProperty(TSTATE, tstate);
	}

	public List findAll() {
		log.debug("finding all Tweets instances");
		try {
			String queryString = "from Tweets";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Tweets merge(Tweets detachedInstance) {
		log.debug("merging Tweets instance");
		try {
			Tweets result = (Tweets) getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Tweets instance) {
		log.debug("attaching dirty Tweets instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Tweets instance) {
		log.debug("attaching clean Tweets instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TweetsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TweetsDAO) ctx.getBean("TweetsDAO");
	}
}